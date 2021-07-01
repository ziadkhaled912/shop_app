import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_final/modules/login/login_screen.dart';
import 'package:shop_app_final/modules/on_boarding/on_boarding_screen.dart';
import 'package:shop_app_final/shared/bloc_observer.dart';
import 'package:shop_app_final/shared/cubit/cubit.dart';
import 'package:shop_app_final/shared/cubit/states.dart';
import 'package:shop_app_final/shared/network/local/cache_helper.dart';
import 'package:shop_app_final/shared/network/remote/dio_helper.dart';
import 'package:shop_app_final/shared/styles/themes.dart';

import 'modules/home_layout/home_layout.dart';

void main() async{
  // Bloc observer
  Bloc.observer = MyBlocObserver();
  // To make sure run widgets after initialization (when main is async)
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init(); // Dio Initialize
  await CacheHelper.init(); // Cache Initialize

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getData(key: "token");

  if(onBoarding != null) {
    if(token != null) widget = HomeLayout();
    else widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp({
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'Shop App',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}