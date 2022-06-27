import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pido_app/modules/addresses/new_address/new_address_screen.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Addresses',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'New Address',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewAddressScreen()));
            },
            icon: const Icon(
              Icons.add,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    onLongPress: () {
                      showModalBottomSheet(
                        context: context,
                        constraints:
                        const BoxConstraints(maxHeight: 290, minWidth: double.infinity),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 20, bottom: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 6,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Default Address',
                                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                ),
                                const Divider(
                                  height: 40,
                                ),

                                const Text(
                                  'Sure you want to make it the default address?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 17, height: 1.4, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: TextButton(
                                    onPressed: () {

                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(const Color.fromRGBO(244, 236, 207, 1)),
                                        foregroundColor:
                                        MaterialStateProperty.all(Colors.black)),
                                    child: const Text('Confirm', style: TextStyle(fontSize: 17),),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                    ),
                                    child: const Text('Cancel', style: TextStyle(fontSize: 17),),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
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
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text(
                                      'Delivery Address',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (index == 0)
                                      Text(
                                        '(Default)',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[500]),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      maxWidth: 50,
                                      maxHeight: 50,
                                    ),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: const Icon(Icons.edit),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      maxWidth: 50,
                                      maxHeight: 50,
                                    ),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: const Icon(Icons.cancel),
                                  ),
                                ],
                              ),
                            ],
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
