import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Order Id:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('22018452'),
                        const Spacer(),
                        Text(
                          'New',
                          style: TextStyle(color: Colors.red[500]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
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
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '165.00 KWD',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
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
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '3/12/2021',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike Shoes',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height:30,
                            ),
                            Text(
                              '225.00 KWD',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index)=> const SizedBox(height: 20,),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 15,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Sub Price'), Text('150.00 KWD')],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Shipping'), Text('15.00 KWD')],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('Discount'), Text('00.00 KWD')],
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
                height: 15,
              ),
              Container(
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
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivery Address',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Text('Area:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Gaza')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text('Street:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Alrsheed Street')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text('House:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Nuseirat Western Entrance')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.calendar_today,
                          size: 23,
                          color: Color.fromRGBO(233, 213, 232, 1),
                        ),
                        SizedBox(width: 20,),
                        Text('Date of receipt:', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 32,),
                        Text('10/01/2022', style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Row(
                      children: const [
                        Icon(
                          Icons.timer,
                          size: 23,
                          color: Color.fromRGBO(233, 213, 232, 1),
                        ),
                        SizedBox(width: 20,),
                        Text('Time of receipt:', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 30,),
                        Text('10:00 - 12:00 Am', style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
