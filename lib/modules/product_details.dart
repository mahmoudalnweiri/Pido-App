import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';
import 'package:pido_app/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.model}) : super(key: key);

  ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Product Details',
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      model!.product_image!.name!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, bottom: 16.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${model!.product_translate!.name}',
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (model!.offerprice == 0)
                              Text(
                                '${model!.price!.toDouble()} KWD',
                                style: const TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ),
                            if (model!.offerprice != 0)
                              Column(
                                children: [
                                  Text(
                                    '${model!.price!.toDouble()} KWD',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    '${model!.offerprice!.toDouble()} KWD',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          model!.product_translate!.description!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(height: 1.3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'SKU',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Tshirt-Red-M',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Similar Products',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: cubit.similarProducts.isNotEmpty ? 290 : 100,
                        child: cubit.similarProducts.isNotEmpty
                            ? ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(10.0),
                                itemCount: cubit.similarProducts.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      cubit.getSimilarProducts(
                                          subId: cubit.similarProducts[index]
                                              .subcategoryId!,
                                          pId:
                                              cubit.similarProducts[index].id!);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                      model:
                                                          cubit.similarProducts[
                                                              index])));
                                    },
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: 180,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.16),
                                              blurRadius: 6.0,
                                              offset: const Offset(0.0, 3.0),
                                            )
                                          ]),
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        cubit.similarProducts[index].product_image!.name!),
                                                    fit: BoxFit.fill
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 3,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 17,
                                                  backgroundColor:
                                                      Colors.black38,
                                                  child: IconButton(
                                                    iconSize: 23,
                                                    onPressed: () {},
                                                    padding: EdgeInsets.zero,
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: index == 0
                                                          ? Colors.red[600]
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (cubit.similarProducts[index]
                                                      .offerprice !=
                                                  0)
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: Colors.red,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: ClipPath(
                                                        clipper: StarClipper(8),
                                                        child: Container(
                                                          color: Colors
                                                              .amberAccent,
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  radius: 3,
                                                                ),
                                                                Text(
                                                                  '${cubit.discountPercentage(price: cubit.similarProducts[index].price!, priceOffer: cubit.similarProducts[index].offerprice!)}%',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                                const CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
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
                                            cubit.similarProducts[index]
                                                .product_translate!.name!,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          SizedBox(
                                            height: cubit.similarProducts[index]
                                                        .offerprice !=
                                                    0
                                                ? 4.5
                                                : 10,
                                          ),
                                          if (cubit.similarProducts[index]
                                                  .offerprice ==
                                              0)
                                            Text(
                                              '${cubit.similarProducts[index].price!.toDouble()} KWD',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19),
                                            ),
                                          if (cubit.similarProducts[index]
                                                  .offerprice !=
                                              0)
                                            Column(
                                              children: [
                                                Text(
                                                  '${cubit.similarProducts[index].price!.toDouble()} KWD',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                ),
                                                Text(
                                                  '${cubit.similarProducts[index].offerprice!.toDouble()} KWD',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 19),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'There are no similar products',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        //color: Theme.of(context).scaffoldBackgroundColor,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: 6,
                              offset: const Offset(0, 0))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    icon: const Icon(Icons.remove),
                                  ),
                                  const Text(
                                    '0',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0))),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 19)),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(244, 236, 207, 1),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: const Text('Add To Cart'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                const Color.fromRGBO(244, 236, 207, 1),
                            child: IconButton(
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
