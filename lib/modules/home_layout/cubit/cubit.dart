import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/models/cart_model.dart';
import 'package:shop_app_final/models/categories_model.dart';
import 'package:shop_app_final/models/change_cart_model.dart';
import 'package:shop_app_final/models/change_favorites_model.dart';
import 'package:shop_app_final/models/favorites_model.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/models/login_model.dart';
import 'package:shop_app_final/models/update_cart_model.dart';
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
  // Current nav index
  int currentIndex = 0;
  // List of nav screens
  List<Widget> bottomScreens = [
    ShopScreen(),
    // TrueViewScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
  // Change nav function
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
  // Get Home Data function
  HomeModel? homeModel;

  Map<int, bool> favorites = {};

  Map<int, bool> cart = {};

  void getHomeData() {
    emit(ShopLoadingHomeDateState());
    DioHelper.getData(url: HOME, lang: 'en', token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // Favorites
      homeModel!.data!.products.forEach((element)
      {
        favorites.addAll({
          element.id : element.inFavorites,
        });
      });
      // cart
      homeModel!.data!.products.forEach((element)
      {
        cart.addAll({
          element.id : element.inCart,
        });
      });
      emit(ShopSuccessHomeDateState());
    }).catchError((error){
      emit(ShopErrorHomeDateState());
      print(error.toString());
    });
  }

  // Get Categories Data function
  CategoriesModel? categoriesModel;
  void getCategoriesData()
  {
    DioHelper.getData(url: GET_CATEGORIES, lang: 'en',token: token).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesDateState());
    }).catchError((error) {
      emit(ShopErrorCategoriesDateState());
      print(error.toString());
    });
  }

  /// favorites functions
  ChangeFavoritesModel? changeFavoritesModel;
  
  void changeFavorites(int productId)
  {
    if(favorites[productId] == true) {
      favorites[productId] = false;
      emit(ChangeFavoritesDateState());
    } else {
      favorites[productId] = true;
      emit(ChangeFavoritesDateState());
    }
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id' : productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);

      if(!changeFavoritesModel!.status){
        if(favorites[productId] == true) {
          favorites[productId] = false;
        } else {
          favorites[productId] = true;
        }
      } else {
        getFavorites();
      }
      emit(SuccessChangeFavoritesDateState());
    }).catchError((error) {
      if(!changeFavoritesModel!.status){
        if(favorites[productId] == true) {
          favorites[productId] = false;
        } else {
          favorites[productId] = true;
        }
      }
      emit(ErrorChangeFavoritesDateState());
    });
  }

  FavoritesModel? favouritesModel;

  void getFavorites() {
    emit(GetFavoritesLoading());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
      lang: 'en',
    ).then((value) {
      favouritesModel = FavoritesModel.fromJson(value.data);
      printFullText(favouritesModel!.data.data[0].toString());
      emit(GetFavoritesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesError());
    });
  }

  /// Cart Functions
  ChangeCartModel? changeCartModel;

  void changeCart(int productId){

    if(cart[productId] == true) {
      cart[productId] = false;
      emit(ChangeCartDateState());
    } else {
      cart[productId] = true;
      emit(ChangeCartDateState());
    }
    DioHelper.postData(
      url: CART,
      data: {
          "product_id" : productId,
        },
      token: token,
    ).then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      if(!changeCartModel!.status){
        if(cart[productId] == true) {
          cart[productId] = false;
        } else {
          cart[productId] = true;
        }
      }
      emit(SuccessChangeCartDateState());
    }).catchError((error) {
      if(!changeCartModel!.status){
        if(cart[productId] == true) {
          cart[productId] = false;
        } else {
          cart[productId] = true;
        }
      }
      emit(ErrorChangeCartDateState());
    });
  }
  // get cart
  CartModel? cartModel;

  void getCart() {
    emit(GetCartLoading());

    DioHelper.getData(
      url: CART,
      token: token,
      lang: 'en',
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(GetCartSuccess());
    }).catchError((error) {
      printFullText(error.toString());
      emit(GetCartError());
    });
  }

  // update cart
  UpdateCartModel? updateCartModel;

  void updateCart({
    required int itemId,
    required int quantity,
  }) {
    emit(UpdateCartLoading());
    DioHelper.putData(
      url: CART + '/$itemId',
      token: token,
      lang: 'en',
      data: {
        "quantity": quantity,
      }
    ).then((value) {
      updateCartModel = UpdateCartModel.fromJson(value.data);
      getCart();
      emit(UpdateCartSuccess());
    }).catchError((error) {
      printFullText(error.toString());
      emit(UpdateCartError());
    });
  }

  // Delete from cart
  void deleteCart({
    required int itemId,
  }) {
    DioHelper.deleteData(
      url: CART + '/$itemId',
      token: token,
      lang: 'en',
    ).then((value) {
      getCart();
      emit(UpdateCartSuccess());
    }).catchError((error) {
      printFullText(error.toString());
      emit(UpdateCartError());
    });
  }

  /// User Functions
  // get user
  LoginModel? userModel;
  void getUserData() {
    emit(GetUserDataLoadingState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
      lang: 'en',
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel!.data!.name);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      printFullText(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  // update user function
  LoginModel? updateModel;
  void updateUser({
    required String name,
    required String phoneNumber,
  }) {
    emit(GetUserDataLoadingState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      data:
      {
        "name": name,
        "phone": phoneNumber,
        "email": userModel!.data!.email,
        "password": "123456",
        "image": 'safasfsa',
      },
      token: token,
      lang: 'en',
    ).then((value) {
      updateModel = LoginModel.fromJson(value.data);
      getUserData();
      print(userModel!.message);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState());
    });
  }
}