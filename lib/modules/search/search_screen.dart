import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/modules/search/cubit/search_cubit.dart';
import 'package:pido_app/modules/search/cubit/search_states.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Container(
              height: 36,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: searchController,
                  cursorWidth: 1,
                  cursorColor: Colors.black,
                  onSubmitted: (value) {
                    cubit.getSearchResults(keyWord: value);
                    cubit.recent.add(value);
                    CacheHelper.setListString(
                        key: 'recent', value: cubit.recent);
                  },
                  onChanged: (value) {
                    cubit.getSearchSuggestions(keyWord: value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            titleSpacing: 5,
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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Recent',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.recent.length,
                  reverse: true,
                  separatorBuilder: (context, state) =>
                      const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
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
                if (cubit.searchSuggestions.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.searchSuggestions.length,
                    reverse: true,
                    separatorBuilder: (context, state) =>
                        const SizedBox(height: 0),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
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
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: 100,
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
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black54,
                              child:
                                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
                            ),
                            const SizedBox(
                              width: 30,
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
