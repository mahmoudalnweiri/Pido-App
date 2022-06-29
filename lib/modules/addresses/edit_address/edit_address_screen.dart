import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';

import '../../../shared/components/widgets.dart';

class EditAddressScreen extends StatefulWidget {
  EditAddressScreen({Key? key, this.addressId, this.index}) : super(key: key);

  final int? addressId;
  final int? index;

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController cityController;
  late TextEditingController areaController;
  late TextEditingController streetController;
  late TextEditingController houseController;

  @override
  initState() {
    super.initState();
    cityController = TextEditingController();
    areaController = TextEditingController();
    streetController = TextEditingController();
    houseController = TextEditingController();

    // Insert the values that was before edit
    areaController.text = PidoCubit.get(context).addresses[widget.index!].area!;
    streetController.text = PidoCubit.get(context).addresses[widget.index!].street!;
    houseController.text = PidoCubit.get(context).addresses[widget.index!].house!;
  }

  @override
  dispose() {
    super.dispose();
    cityController.dispose();
    areaController.dispose();
    streetController.dispose();
    houseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Edit Address',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: (){
                cubit.getAddresses();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
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
                        child: Center(
                          child: TextFormField(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                constraints: const BoxConstraints(
                                    maxHeight: 400, minWidth: double.infinity),
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
                                          'Select City',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Divider(
                                          height: 40,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            physics: const BouncingScrollPhysics(),
                                            itemCount: cubit.cities.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {
                                                  cityController.text =
                                                      cubit.cities[index].name!;
                                                  cubit.selectedCityId =
                                                      cubit.cities[index].id;
                                                  Navigator.pop(context);
                                                },
                                                title: Text(
                                                    cubit.cities[index].name!, style: const TextStyle(fontWeight: FontWeight.w500),),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            controller: cityController,
                            cursorColor: Colors.black87,
                            cursorWidth: 1,
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must choose a city';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'City',
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.black87,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                            ),
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
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
                        child: Center(
                          child: TextFormField(
                            controller: areaController,
                            cursorColor: Colors.black87,
                            cursorWidth: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The field must not be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Area',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0)),
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
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
                        child: Center(
                          child: TextFormField(
                            controller: streetController,
                            cursorColor: Colors.black87,
                            cursorWidth: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The field must not be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Street',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0)),
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
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
                        child: Center(
                          child: TextFormField(
                            controller: houseController,
                            cursorColor: Colors.black87,
                            cursorWidth: 1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The field must not be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'House Description',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0)),
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      buildDefaultButton(
                        label: 'Confirm',
                        backColor: const Color.fromRGBO(244, 236, 207, 1),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState!.validate()) {
                            cubit.editAddress(
                              addressId: widget.addressId!,
                              cityId: cubit.selectedCityId!,
                              area: areaController.text,
                              street: streetController.text,
                              house: houseController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
