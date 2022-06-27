import 'package:pido_app/models/register_model.dart';

abstract class RegisterStates{}

class InitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final RegisterUserModel model;

  RegisterSuccessState(this.model);
}

class RegisterErrorState extends RegisterStates{}