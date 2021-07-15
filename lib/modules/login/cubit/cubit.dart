import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/models/login_model.dart';
import 'package:shop_app_final/modules/login/cubit/states.dart';
import 'package:shop_app_final/shared/network/end_points.dart';
import 'package:shop_app_final/shared/network/remote/dio_helper.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isSecure = true; // Secure
  IconData suffix = Icons.visibility;

  void changePasswordVisibility()
  {
    isSecure = !isSecure;
    suffix = isSecure ? Icons.visibility : Icons.visibility_off;

    emit(LoginChangePasswordState());
  }
  // Login Model
  late LoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  // register function
  late LoginModel registerModel;

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data:
      {
        'name' : name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value)
    {
      registerModel = LoginModel.fromJson(value.data);
      print(registerModel.message);
      emit(LoginSuccessState(registerModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}