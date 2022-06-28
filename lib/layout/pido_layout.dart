import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';
import 'package:pido_app/modules/favorites/favorites_screen.dart';
import 'package:pido_app/modules/login/login_screen.dart';
import 'package:pido_app/modules/new_arrival/new_arrival_screen.dart';
import 'package:pido_app/modules/offers/offers_screen.dart';
import 'package:pido_app/modules/orders/my_orders_screen.dart';

import '../modules/addresses/addresses_screen.dart';
import '../modules/cart/shopping_cart_screen.dart';
import '../modules/home/home_screen.dart';

class PidoLayout extends StatelessWidget {
  PidoLayout({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, i) => [
                SliverAppBar(
                  expandedHeight: 100,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 50,
                          width: 33,
                          child: Center(
                            child: Image.asset(
                              'assets/images/Group 47196.png',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: const Text('Pido'),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                  backgroundColor: const Color.fromRGBO(233, 213, 232, 1),
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    Badge(
                      position: BadgePosition.topEnd(top: 5, end: 5),
                      badgeContent: Text(
                        '3',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      padding: EdgeInsets.all(3 >= 10 ? 3 : 5),
                      badgeColor: Colors.red[600]!,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ShoppingCartScreen()));
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Color.fromRGBO(233, 213, 232, 1),
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ],
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: const [
                  HomeScreen(),
                  /*Positioned(
                  left: 10,
                  right: 10,
                  bottom: 8,
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2), width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.white.withOpacity(0.95),
                        selectedItemColor: Colors.blue[800],
                        unselectedItemColor: Colors.black,
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.black),
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite_outline),
                            label: 'Favorites',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.location_on_outlined),
                            label: 'Addresses',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person_outlined),
                            label: 'Profile',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 147,
                    width: double.infinity,
                    child: DrawerHeader(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(233, 213, 232, 1),
                      ),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/Group 47196.png',
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.discount_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'Offers',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const OffersScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.new_releases_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'New Arrival',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      cubit.getNewArrival();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NewArrivalScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'Address',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AddressesScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'My Orders',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MyOrdersScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'Favorites',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const FavoritesScreen()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.contact_mail_outlined,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'Contact',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 27,
                    ),
                    title: const Text(
                      'About',
                      style: TextStyle(fontSize: 19),
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    height: 50,
                  ),
                  ListTile(
                    title: const Text(
                      'Add account',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                    onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
