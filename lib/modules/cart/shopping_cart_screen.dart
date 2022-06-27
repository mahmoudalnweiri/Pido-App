import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/components/widgets.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _CartShoppingScreenState();
}

class _CartShoppingScreenState extends State<ShoppingCartScreen> {
  late TextEditingController discountController;

  @override
  initState() {
    super.initState();
    discountController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    discountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor, statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 16.0),
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 130,
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
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ6gpQYviTbMVn_fjcDMwseb-4vLTIjUTIrA&usqp=CAU'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Nike Shoes',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color.fromRGBO(
                                          244, 236, 207, 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          blurRadius: 3,
                                          offset: const Offset(0, 2),
                                        )
                                      ]),
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
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 17,
                                        ),
                                      ),
                                      const Text(
                                        '0',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        icon: const Icon(
                                          Icons.add,
                                          size: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '225.0 KWD',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: IconButton(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: const Icon(Icons.cancel),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Sub Price'), Text('150.00 KWD'),],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Shipping'), Text('15.00 KWD'),],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Discount'), Text('00.00 KWD'),],
                    ),
                    const Divider(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Price',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          '165.00 KWD',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: discountController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Promo Code',
                            contentPadding: EdgeInsets.only(left: 16.0)),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(233, 213, 232, 1)),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {},
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              buildDefaultButton(
                label: 'Checkout',
                backColor: const Color.fromRGBO(233, 213, 232, 1),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
