import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pido_app/modules/orders/order_details/order_details_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor, statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                children: [
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromRGBO(233, 213, 232, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('All')),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('New')),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('In Progress')),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('On Delivery')),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('Completed')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const OrderDetailsScreen()));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
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
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Order Id:',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('22018452'),
                                  ],
                                ),
                                const SizedBox(height: 23,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.attach_money_outlined,
                                            size: 23,
                                            color: Color.fromRGBO(233, 213, 232, 1),
                                          ),
                                          SizedBox(width: 8,),
                                          Text('165.00 KWD', style: TextStyle(fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 23,
                                            color: Color.fromRGBO(233, 213, 232, 1),
                                          ),
                                          SizedBox(width: 8,),
                                          Text('3/12/2021', style: TextStyle(fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('New', style: TextStyle(color: Colors.red[500]),),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(244, 236, 207, 1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Center(
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
