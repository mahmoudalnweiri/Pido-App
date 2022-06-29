import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';
import 'package:pido_app/modules/addresses/edit_address/edit_address_screen.dart';
import 'package:pido_app/modules/addresses/new_address/new_address_screen.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Addresses',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: 'New Address',
                alignment: Alignment.center,
                onPressed: () {
                  cubit.getCities();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const NewAddressScreen()));
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
            child: state is SuccessGetAddressesState &&
                    cubit.addresses.isNotEmpty
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              const EdgeInsets.only(top: 25.0, bottom: 10.0),
                          itemCount: cubit.addresses.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onLongPress: () {
                                showModalBottomSheet(
                                  context: context,
                                  constraints: const BoxConstraints(
                                      maxHeight: 290,
                                      minWidth: double.infinity),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 20,
                                          bottom: 20,
                                          left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 4,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              color: Colors.black45,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            'Default Address',
                                            style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(
                                            height: 40,
                                          ),
                                          const Text(
                                            'Sure you want to make it the default address?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 17,
                                                height: 1.4,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 45,
                                            child: TextButton(
                                              onPressed: () {
                                                cubit.editAddress(
                                                  addressId: cubit
                                                      .addresses[index].id!,
                                                  cityId: cubit
                                                      .addresses[index].cityId!,
                                                  area: cubit
                                                      .addresses[index].area!,
                                                  street: cubit
                                                      .addresses[index].street!,
                                                  house: cubit
                                                      .addresses[index].house!,
                                                  isDefault: true,
                                                );
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          const Color.fromRGBO(
                                                              244,
                                                              236,
                                                              207,
                                                              1)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.black)),
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 45,
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0))),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(fontSize: 17),
                                              ),
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              if (cubit.addresses[index]
                                                      .isdefault ==
                                                  1)
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
                                              onPressed: () {
                                                cubit.getCities();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditAddressScreen(
                                                              addressId: cubit
                                                                  .addresses[
                                                                      index]
                                                                  .id,
                                                              index: index,
                                                            )));
                                              },
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(
                                                maxWidth: 50,
                                                maxHeight: 50,
                                              ),
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              icon: const Icon(Icons.edit),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                cubit.addressDeleted =
                                                    cubit.addresses[index];
                                                cubit.deleteAddress(
                                                    addressId: cubit
                                                        .addresses[index].id!,
                                                    index: index);
                                              },
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(
                                                maxWidth: 50,
                                                maxHeight: 50,
                                              ),
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
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
                                      children: [
                                        const Text('City:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(cubit.addresses[index].city!
                                            .city_translate!.name!)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Area:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(cubit.addresses[index].area!)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Street:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(cubit.addresses[index].street!)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text('House:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(cubit.addresses[index].house!)
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
                  )
                : state is SuccessGetAddressesState && cubit.addresses.isEmpty
                    ? Center(
                        child: Text(
                          'Don\'t have addresses yet!\nAdd addresses now',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14, height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
          ),
        );
      },
    );
  }
}
