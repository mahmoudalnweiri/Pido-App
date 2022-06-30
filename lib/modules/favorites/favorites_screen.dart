import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';
import 'package:pido_app/modules/product_details.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Favorites',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: SafeArea(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 330,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: cubit.favoriteModel!.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    cubit.getSimilarProducts(
                        subId: cubit.favoriteModel!.data[index].productData!
                            .subcategoryId!,
                        pId: cubit.favoriteModel!.data[index].productData!.id!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                model: cubit
                                    .favoriteModel!.data[index].productData!)));
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                        begin: AlignmentDirectional.bottomCenter,
                        end: AlignmentDirectional.topCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: NetworkImage(cubit
                                      .favoriteModel!
                                      .data[index]
                                      .productData!
                                      .product_image!
                                      .name!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              right: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black38,
                                child: IconButton(
                                  alignment: Alignment.center,
                                  iconSize: 23,
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            if (cubit.favoriteModel!.data[index].productData!
                                    .offerprice! >
                                0)
                              Positioned(
                                top: 0,
                                left: 0,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: ClipPath(
                                      clipper: StarClipper(8),
                                      child: Container(
                                        color: Colors.amberAccent,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 3,
                                              ),
                                              Text(
                                                '${cubit.discountPercentage(price: cubit.favoriteModel!.data[index].productData!.price!, priceOffer: cubit.favoriteModel!.data[index].productData!.offerprice!)}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              const CircleAvatar(
                                                backgroundColor: Colors.white,
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
                          cubit.favoriteModel!.data[index].productData!
                              .product_translate!.name!,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: cubit.favoriteModel!.data[index].productData!
                                      .offerprice ==
                                  0
                              ? 10
                              : 4.5,
                        ),
                        if (cubit.favoriteModel!.data[index].productData!
                                .offerprice ==
                            0)
                          Text(
                            '${cubit.favoriteModel!.data[index].productData!.price!.toDouble()} KWD',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        if (cubit.favoriteModel!.data[index].productData!
                                .offerprice! >
                            0)
                          Column(
                            children: [
                              Text(
                                '${cubit.favoriteModel!.data[index].productData!.price!.toDouble()} KWD',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              Text(
                                '${cubit.favoriteModel!.data[index].productData!.offerprice!.toDouble()} KWD',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: cubit.favoriteModel!.data[index].productData!
                                      .offerprice ==
                                  0
                              ? 10
                              : 2,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(244, 236, 207, 1)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          child: const Text('Add To Cart'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
