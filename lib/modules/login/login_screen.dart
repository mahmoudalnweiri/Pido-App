import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/pido_layout.dart';
import 'package:pido_app/modules/login/cubit/login_cubit.dart';
import 'package:pido_app/modules/login/cubit/login_states.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';

import '../../shared/components/widgets.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model.username != null) {
              CacheHelper.setData(key: 'token', value: state.model.accessToken)
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
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black87),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
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
                            'LOGIN',
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
                            'Login now to browse our hot offers',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          buildTextFormFiled(
                            controller: emailController,
                            icon: Icons.email_outlined,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter your email correctly';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildTextFormFiled(
                            controller: passwordController,
                            hintText: 'Password',
                            icon: Icons.lock_open_outlined,
                            keyboardType: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Password is too short';
                              }
                              return null;
                            },
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
                                  cubit.loginUser(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
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
                              child: state is! LoginLoadingState
                                  ? const Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              const SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  alignment: AlignmentDirectional.centerStart,
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: const Text('Register'),
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
