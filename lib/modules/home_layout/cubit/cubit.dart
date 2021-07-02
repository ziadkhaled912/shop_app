import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/modules/Shop_screen/Shop_screen.dart';
import 'package:shop_app_final/modules/cart/cart_screen.dart';
import 'package:shop_app_final/modules/category/categories_screen.dart';
import 'package:shop_app_final/modules/favourites/favourites_screen.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:shop_app_final/modules/settings/settings_screen.dart';
import 'package:shop_app_final/shared/componants/constants.dart';
import 'package:shop_app_final/shared/network/end_points.dart';
import 'package:shop_app_final/shared/network/remote/dio_helper.dart';


class HomeCubit extends Cubit<HomeStates>
{
  // Cubit Constructor
  HomeCubit() : super(HomeInitialState());
  // Cubit methode
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ShopScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
  HomeModel homeModel;
  void getHomeData({
    String token,
  }) {
    emit(ShopLoadingHomeDateState());

    DioHelper.getData(url: HOME, lang: 'en').then((value) {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel.data.banners[2].image);
      emit(ShopSuccessHomeDateState());
    }).catchError((error){
      emit(ShopErrorHomeDateState());
      print(error.toString());
    });
  }
}