import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title : Text("Settings",),
            ),
            body: Center(child: Text("settings screen"),),
          );
        },
      ),
    );

  }
}