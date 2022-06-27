import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor, statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,),
      ),
      body: SafeArea(
        child: GridView.builder(
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
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /*cubit.getSimilarProducts(subId: cubit.newArrivalProducts[index].subcategoryId!, pId: cubit.newArrivalProducts[index].id!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ProductDetails(model: cubit.newArrivalProducts[index])));*/
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
                  /*boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 6.0,
                offset: const Offset(0.0, 3.0),
              )
            ]*/),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
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
                        if (index > 0)
                          Positioned(
                            top: 3,
                            left: 3,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 3,
                                          ),
                                          Text(
                                            '17%',
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w900),
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
                      'Jaket',
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: index == 0 ? 10 : 4.5,
                    ),
                    if (index == 0)
                      Text(
                        '125.0 KWD',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    if (index != 0)
                      Column(
                        children: [
                          Text(
                            '125.0 KWD',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            '100.0 KWD',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: index == 0 ? 10 : 2,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(244, 236, 207, 1)),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
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
  }
}
