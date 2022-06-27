import 'package:flutter/material.dart';

import '../../../shared/components/widgets.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController titleController;
  late TextEditingController areaController;
  late TextEditingController streetController;
  late TextEditingController houseController;

  @override
  initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    titleController = TextEditingController();
    areaController = TextEditingController();
    streetController = TextEditingController();
    houseController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    titleController.dispose();
    areaController.dispose();
    streetController.dispose();
    houseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Address'),
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
                        controller: nameController,
                        cursorColor: Colors.black87,
                        cursorWidth: 1,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                        ),
                        textCapitalization: TextCapitalization.sentences,
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
                        controller: emailController,
                        cursorColor: Colors.black87,
                        cursorWidth: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
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
                        controller: phoneController,
                        cursorColor: Colors.black87,
                        cursorWidth: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
                        keyboardType: TextInputType.phone,
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
                        controller: titleController,
                        cursorColor: Colors.black87,
                        cursorWidth: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address Title',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
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
                        controller: areaController,
                        cursorColor: Colors.black87,
                        cursorWidth: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Area',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
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
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Street',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
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
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'House Description',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  buildDefaultButton(
                    label: 'Confirm',
                    backColor: const Color.fromRGBO(244, 236, 207, 1),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      /*if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }*/
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
