import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:pido_app/models/product_model.dart';

import '../../layout/cubit/pido_cubit.dart';
import '../../modules/categories/categories_screen.dart';
import '../../modules/product_details.dart';

InkWell buildProductItem({
  required BuildContext context,
  required ProductModel model,
  required PidoCubit cubit,
  required int index,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
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
              if (model.offerprice! > 0)
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
                                  '${cubit.discountPercentage(price: model.price!, priceOffer: model.offerprice!)}%',
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
            model.product_translate!.name!,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: model.offerprice == 0 ? 10 : 4.5,
          ),
          if (model.offerprice == 0)
            Text(
              '${model.price!.toDouble()} KWD',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          if (model.offerprice != 0)
            Column(
              children: [
                Text(
                  '${model.price!.toDouble()} KWD',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
                Text(
                  '${model.offerprice!.toDouble()} KWD',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
            ),
          SizedBox(
            height: model.offerprice == 0 ? 10 : 2,
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
}

InkWell buildCategoryCard({
  required BuildContext context,
  required PidoCubit cubit,
  required int index,
  required String imageUrl,
  required String title,
}) {
  return InkWell(
    onTap: () {
      if(index == 0){
        cubit.getMenProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else if(index == 1){
        cubit.getWomenProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else if(index == 2){
        cubit.getGadgetsProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else if(index == 3){
        cubit.getGamingProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else if(index == 4){
        cubit.getDevicesProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else if(index == 5){
        cubit.getPetsProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }else{
        cubit.getCampingProducts();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(title: toBeginningOfSentenceCase(title))));
      }
    },
    borderRadius: BorderRadius.circular(12.0),
    child: Container(
      width: 120,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: index == 0
                ? 20
                : index == 2
                    ? 5
                    : index == 1 || index == 4 ? 10 : 14,
          ),
          Image.asset(imageUrl),
          const Spacer(),
          Text(
            toBeginningOfSentenceCase(cubit.categories[index].name)!,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Container buildSliderImage({
  required String imageUrl,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
    ),
  );
}

InkWell buildOfferCard(
    {required BuildContext context,
    required PidoCubit cubit,
    required int index}) {
  return InkWell(
    onTap: () {
      cubit.getSimilarProducts(subId: cubit.offers[index].subcategoryId!, pId: cubit.offers[index].id!);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProductDetails(
                    model: cubit.offers[index],
                  )));
    },
    borderRadius: BorderRadius.circular(12.0),
    child: Container(
      width: 140,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 6.0,
            offset: const Offset(0.0, 3.0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ6gpQYviTbMVn_fjcDMwseb-4vLTIjUTIrA&usqp=CAU'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: CircleAvatar(
                  radius: 18,
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
                                '${cubit.discountPercentage(price: cubit.offers[index].price!, priceOffer: cubit.offers[index].offerprice!)}%',
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
            cubit.offers[index].product_translate!.name!,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                '${cubit.offers[index].price!.toDouble()} KWD',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
              Text(
                '${cubit.offers[index].offerprice!.toDouble()} KWD',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Padding buildSectionTitle({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color.fromRGBO(233, 213, 232, 1),
            thickness: 2,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 15,
        ),
        const Expanded(
          child: Divider(
            color: Color.fromRGBO(233, 213, 232, 1),
            thickness: 2,
          ),
        ),
      ],
    ),
  );
}

Container buildTextFormFiled({
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  TextInputType? keyboardType,
  String? Function(String?)? validate,
}) {
  return Container(
    constraints: const BoxConstraints(minHeight: 60),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black87,
          cursorWidth: 1,
          validator: validate,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: const Color.fromRGBO(233, 213, 232, 1),
            ),
            hintText: hintText,
            contentPadding: const EdgeInsets.only(top: 16.0, left: 16.0),
            constraints: const BoxConstraints(
              minHeight: 40,
            ),
          ),
          keyboardType: keyboardType,
        ),
      ),
    ),
  );
}

Container buildDefaultButton({
  required String label,
  required Color backColor,
  EdgeInsetsGeometry? margin,
  required void Function()? onPressed,
}) {
  return Container(
    height: 50.0,
    width: double.infinity,
    margin: margin,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backColor),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        elevation: MaterialStateProperty.all(7.0),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.45)),
      ),
      child: const Text(
        'Confirm',
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
