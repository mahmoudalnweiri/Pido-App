import 'package:pido_app/models/login_model.dart';

abstract class LoginStates {}

class InitialState extends LoginStates{}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates{
  final LoginUserMode model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates{}