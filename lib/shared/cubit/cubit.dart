import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/shared/cubit/states.dart';


class AppCubit extends Cubit<AppStates>
{
  // Cubit Constructor
  AppCubit() : super(AppInitialState());
  // Cubit methode
  static AppCubit get(context) => BlocProvider.of(context);

}