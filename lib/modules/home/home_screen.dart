import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';

import '../../shared/components/widgets.dart';
import '../offers/offers_screen.dart';
import '../product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return cubit.categories.isNotEmpty &&
                cubit.categoryProducts['All']!.isNotEmpty &&
                cubit.offers.isNotEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      items: [
                        buildSliderImage(
                            imageUrl:
                                'https://photo-cdn2.icons8.com/8AdNKcgsiKzRLEHRQZAnFCJo7eVV2xbwdYgtyn1KpyQ/rs:fit:288:192/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvOTIxLzhmMmEw/ZjM0LWI3ZWItNDhk/OC1hZGM4LWI2MDMz/ZjZlNDJmZi5qcGc.jpg'),
                        buildSliderImage(
                            imageUrl:
                                'https://photo-cdn2.icons8.com/UAOsADcxZEQWtH2eJXz95TLsqxXfzgJ6M1S6RYi3GUE/rs:fit:288:192/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvNTAwLzZkYTAx/NmZhLWQxNzQtNGYw/NC1iZjVhLTQ1ZjJl/Yjk5NDkwMy5qcGc.jpg'),
                        buildSliderImage(
                            imageUrl:
                                'https://photo-cdn2.icons8.com/5EUXevCvSjUfCABK1-BVfR1MxlPgJYpavjPdU2HVu4w/rs:fit:288:192/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvNTkwL2JlZDNi/MmQ4LTRhODYtNGMy/OS05MTNmLWM1YzQ3/OWRlNGNhNS5qcGc.jpg'),
                        buildSliderImage(
                            imageUrl:
                                'https://photo-cdn2.icons8.com/sQelET_DxAyxnfwZ92m7ON0mnN2a52A3rvGaDGWwoos/rs:fit:288:192/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvNDYwL2IwM2I3/NzJmLTAxOWEtNDc1/Yi05OGQ1LTBlOTA1/NmZjOTc1My5qcGc.jpg'),
                      ],
                      options: CarouselOptions(
                        height: 160.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 8),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    /*Align(
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  constraints: const BoxConstraints(minWidth: 40),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color.fromRGBO(233, 213, 232, 1)
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Text(
                                  'What are you looking for?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    //buildSectionTitle(title: 'Offers'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Offers',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 215,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            cubit.offers.length > 5 ? 5 : cubit.offers.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              buildOfferCard(
                                  context: context, cubit: cubit, index: index),
                              if (cubit.offers.length > 5 && index == 4)
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const OffersScreen()));
                                  },
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    width: 140,
                                    padding: const EdgeInsets.all(10.0),
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        //gradient: LinearGradient(colors: [Colors.transparent, Colors.black54], begin: AlignmentDirectional.centerStart, end: AlignmentDirectional.centerEnd),
                                        color: Colors.black54),
                                    child: const Center(
                                      child: Text(
                                        'see more',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          );
                        },
                      ),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    //buildSectionTitle(title: 'Categories'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(10.0),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.categories.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemBuilder: (context, index) {
                          return buildCategoryCard(
                            context: context,
                            cubit: cubit,
                            index: index,
                            imageUrl: index == 0
                                ? 'assets/images/Icon_Mens Shoe.png'
                                : index == 1
                                    ? 'assets/images/Icon_Womens Shoe.png'
                                    : index == 2
                                        ? 'assets/images/Icon_Gadgets.png'
                                        : index == 3
                                            ? 'assets/images/Icon_Gaming.png'
                                            : 'assets/images/Icon_Devices.png',
                            title: cubit.categories[index].name!,
                          );
                        },
                      ),
                    ),

                    const Divider(
                      height: 30,
                    ),
                    //buildSectionTitle(title: 'New Arrival'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'All Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 330,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: cubit.categoryProducts['All']!.length,
                      itemBuilder: (context, index) {
                        return buildProductItem(
                          context: context,
                          model: cubit.categoryProducts['All']![index],
                          cubit: cubit,
                          index: index,
                          onTap: () {
                            cubit.getSimilarProducts(
                                subId: cubit.categoryProducts['All']![index]
                                    .subcategoryId!,
                                pId: cubit.categoryProducts['All']![index].id!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductDetails(
                                        model: cubit
                                            .categoryProducts['All']![index])));
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
      },
    );
  }
}
