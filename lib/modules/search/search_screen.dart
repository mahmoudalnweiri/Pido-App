import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/modules/product_details.dart';
import 'package:pido_app/modules/search/cubit/search_cubit.dart';
import 'package:pido_app/modules/search/cubit/search_states.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Container(
              height: 35,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: searchController,
                  focusNode: focusNode,
                  cursorWidth: 1,
                  cursorColor: Colors.black,
                  onSubmitted: (value) {
                    if (!RegExp(r'^[ ]*$').hasMatch(value)) {
                      cubit.searchSuggestions = [];
                      cubit.getSearchResults(keyWord: value);
                      cubit.recent.remove(value);
                      cubit.recent.add(value);
                      CacheHelper.setListString(
                        key: 'recent',
                        value: cubit.recent,
                      );
                    }
                  },
                  onChanged: (value) {
                    if (!RegExp(r'^[ ]*$').hasMatch(value)) {
                      cubit.searchResults = [];
                      cubit.getSearchSuggestions(keyWord: value);
                    }
                    if (value == '') {
                      cubit.clearSearch();
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: searchController.text.isEmpty
                        ? const EdgeInsets.fromLTRB(0, 12, 0, 12)
                        : EdgeInsets.zero,
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            splashRadius: 15,
                            onPressed: () {
                              searchController.clear();
                              cubit.clearSearch();
                            },
                            icon: const Icon(
                              Icons.clear,
                              size: 19,
                              color: Colors.black87,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              onPressed: (){
                cubit.clearSearch();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            titleSpacing: 0,
            actions: const [
              SizedBox(
                width: 30,
              )
            ],
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (searchController.text.isNotEmpty)
                  const SizedBox(
                    height: 30,
                  ),
                if (searchController.text.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Recent',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                if (state is LoadingGetResultsSearchState ||
                    state is LoadingGetSearchSuggestionsState)
                  const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                if (searchController.text.isEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.recent.length,
                    reverse: true,
                    separatorBuilder: (context, state) =>
                        const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          searchController.text = cubit.recent[index];
                          FocusManager.instance.primaryFocus?.requestFocus(focusNode);
                          cubit.getSearchSuggestions(
                              keyWord: cubit.recent[index]);
                          //cubit.selectKeywordOfSearch();
                        },
                        title: Text(cubit.recent[index]),
                        trailing: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            cubit.removeSuggestion(index);
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      );
                    },
                  ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.searchSuggestions.length,
                  reverse: true,
                  separatorBuilder: (context, state) =>
                      const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        searchController.text =
                            cubit.searchSuggestions[index].name!;
                        cubit.selectKeywordOfSearch();
                      },
                      title: Text(cubit.searchSuggestions[index].name!),
                    );
                  },
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16.0),
                  itemCount: cubit.searchResults.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        PidoCubit.get(context).getSimilarProducts(
                          subId: cubit.searchResults[index].subcategoryId!,
                          pId: cubit.searchResults[index].id!,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                    model: cubit.searchResults[index])));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: 101,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ6gpQYviTbMVn_fjcDMwseb-4vLTIjUTIrA&usqp=CAU'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.searchResults[index].product_translate!
                                      .name!,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${cubit.searchResults[index].price!.toDouble()} KWD',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black87,
                              size: 30,
                            ),
                            /*const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black54,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ),*/
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
