import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/models/register_model.dart';
import 'package:pido_app/modules/register/cubit/register_states.dart';
import 'package:pido_app/shared/network/end_points.dart';
import 'package:pido_app/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterUserModel? registerModel;

  void registerUser({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'fullname': username,
        'email': email,
        'phonenumber': phone,
        'password': password,
        'confirmPassowrd': confirmPassword,
      },
    ).then((value) {
      print('**********');
      registerModel = RegisterUserModel.fromJson(value.data);
      print(registerModel!.user!.username);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}
