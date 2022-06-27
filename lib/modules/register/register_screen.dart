import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/pido_layout.dart';
import 'package:pido_app/modules/login/login_screen.dart';
import 'package:pido_app/modules/register/cubit/register_cubit.dart';
import 'package:pido_app/modules/register/cubit/register_states.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController phoneController;

  late TextEditingController passwordController;

  late TextEditingController confPasswordController;

  @override
  initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confPasswordController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.model.success!) {
              CacheHelper.setData(
                      key: 'token', value: state.model.user!.accessToken)
                  .then((value) {
                if (value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PidoLayout()));
                }
              });
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black87),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Register now to browse our hot offers',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
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
                                  controller: nameController,
                                  cursorColor: Colors.black87,
                                  cursorWidth: 1,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'The name must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person_outlined,
                                      color: Color.fromRGBO(233, 213, 232, 1),
                                    ),
                                    hintText: 'Full Name',
                                    contentPadding: EdgeInsets.only(
                                        top: 16.0, left: 16.0),
                                    constraints: BoxConstraints(minHeight: 40),
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
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
                                  controller: emailController,
                                  cursorColor: Colors.black87,
                                  cursorWidth: 1,
                                  validator: (String? value) {
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Please enter your email correctly';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Color.fromRGBO(233, 213, 232, 1),
                                      ),
                                      hintText: 'Email',
                                      contentPadding: EdgeInsets.only(
                                          top: 16.0, left: 16.0),
                                    constraints: BoxConstraints(minHeight: 40),),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
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
                                  controller: phoneController,
                                  cursorColor: Colors.black87,
                                  cursorWidth: 1,
                                  validator: (String? value) {
                                    if (value!.length < 10) {
                                      return 'Please enter your phone number correctly';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.phone_outlined,
                                      color: Color.fromRGBO(233, 213, 232, 1),
                                    ),
                                    hintText: 'Phone Number',
                                    contentPadding: EdgeInsets.only(
                                        top: 16.0, left: 16.0),
                                    constraints: BoxConstraints(minHeight: 40),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
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
                                  controller: passwordController,
                                  cursorColor: Colors.black87,
                                  cursorWidth: 1,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (String? value) {
                                    if (value!.length < 6) {
                                      return 'Password is too short';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: Color.fromRGBO(233, 213, 232, 1),
                                      ),
                                      hintText: 'Password',
                                      contentPadding: EdgeInsets.only(
                                          top: 16.0, left: 16.0),
                                    constraints: BoxConstraints(minHeight: 40),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
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
                                  controller: confPasswordController,
                                  cursorColor: Colors.black87,
                                  cursorWidth: 1,
                                  validator: (String? value) {
                                    if (value != passwordController.text) {
                                      return 'Password does not match';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: Color.fromRGBO(233, 213, 232, 1),
                                      ),
                                      hintText: 'Confirm Password',
                                      contentPadding: EdgeInsets.only(
                                          top: 16.0, left: 16.0),
                                    constraints: BoxConstraints(minHeight: 40),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (formKey.currentState!.validate()) {
                                  cubit.registerUser(
                                    username: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    phone: phoneController.text.trim(),
                                    password: passwordController.text.trim(),
                                    confirmPassword:
                                        confPasswordController.text.trim(),
                                  );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(244, 236, 207, 1)),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(7.0),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.black.withOpacity(0.45)),
                              ),
                              child: state is RegisterLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      'REGISTER',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              const SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  alignment: AlignmentDirectional.centerStart,
                                  padding:
                                      MaterialStateProperty.all(EdgeInsets.zero),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: const Text('Login'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
