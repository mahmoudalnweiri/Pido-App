import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';

import '../product_details.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('$title Products', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
                await Future.delayed(const Duration(seconds: 1));
                cubit.filter = null;
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor, statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,),
          ),
          body: SafeArea(
            child: cubit.categoryProducts[title]!.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          constraints: BoxConstraints(
                              maxHeight: 40,
                              minWidth: MediaQuery.of(context).size.width / 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.black87),
                            color: cubit.filter != null
                                ? Colors.black87
                                : Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              style: const TextStyle(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                              hint: const Text(
                                "Sort by",
                                style: TextStyle(color: Colors.black),
                              ),
                              iconEnabledColor: cubit.filter != null
                                  ? Colors.white
                                  : Colors.black,
                              value: cubit.filter,
                              elevation: 4,
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'New',
                                    child: Text(
                                      'New',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                DropdownMenuItem<String>(
                                    value: 'Old',
                                    child: Text(
                                      'Old',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                DropdownMenuItem<String>(
                                    value: 'Price',
                                    child: Text(
                                      'Price',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ],
                              onChanged: (val) {
                                cubit.changeFilter(newValue: val!);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 325,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: cubit.categoryProducts[title]!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProductDetails(
                                                model: cubit.categoryProducts[
                                                    title]![index],
                                              )));
                                },
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.1)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ],
                                      begin: AlignmentDirectional.bottomCenter,
                                      end: AlignmentDirectional.topCenter,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 180,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ6gpQYviTbMVn_fjcDMwseb-4vLTIjUTIrA&usqp=CAU'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: CircleAvatar(
                                              radius: 17,
                                              backgroundColor: Colors.black38,
                                              child: IconButton(
                                                iconSize: 23,
                                                onPressed: () {},
                                                padding: EdgeInsets.zero,
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (cubit
                                                  .categoryProducts[title]![
                                                      index]
                                                  .offerprice! >
                                              0)
                                            Positioned(
                                              top: 3,
                                              left: 3,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.red,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: ClipPath(
                                                    clipper: StarClipper(8),
                                                    child: Container(
                                                      color: Colors.amberAccent,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 3,
                                                            ),
                                                            Text(
                                                              '${cubit.discountPercentage(price: cubit.categoryProducts[title]![index].price!, priceOffer: cubit.categoryProducts[title]![index].offerprice!)}%',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                            const CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.categoryProducts[title]![index]
                                            .product_translate!.name!,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: cubit
                                                    .categoryProducts[title]![
                                                        index]
                                                    .offerprice! ==
                                                0
                                            ? 10
                                            : 4.5,
                                      ),
                                      if (cubit.categoryProducts[title]![index]
                                              .offerprice! ==
                                          0)
                                        Text(
                                          '${cubit.categoryProducts[title]![index].price!.toDouble()} KWD',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      if (cubit.categoryProducts[title]![index]
                                              .offerprice! !=
                                          0)
                                        Column(
                                          children: [
                                            Text(
                                              '${cubit.categoryProducts[title]![index].price!.toDouble()} KWD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                            ),
                                            Text(
                                              '${cubit.categoryProducts[title]![index].offerprice!.toDouble()} KWD',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19),
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: cubit
                                                    .categoryProducts[title]![
                                                        index]
                                                    .offerprice! ==
                                                0
                                            ? 10
                                            : 2,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromRGBO(
                                                        244, 236, 207, 1)),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)))),
                                        child: const Text('Add To Cart'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
