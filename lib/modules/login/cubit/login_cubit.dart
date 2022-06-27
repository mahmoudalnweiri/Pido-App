import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/models/login_model.dart';
import 'package:pido_app/modules/login/cubit/login_states.dart';
import 'package:pido_app/shared/network/end_points.dart';
import 'package:pido_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginUserMode? userModel;

  loginUser({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      userModel = LoginUserMode.fromJson(value.data);
      print(userModel!.username);
      emit(LoginSuccessState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
