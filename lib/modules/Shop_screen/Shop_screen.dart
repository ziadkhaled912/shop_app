import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/Shop_screen/builder_widget.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:shop_app_final/shared/componants/loading_components/shop_loading/home_loading.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if(state is SuccessChangeFavoritesDateState){
          if(HomeCubit.get(context).changeFavoritesModel!.status){
            showToast(
              msg: HomeCubit.get(context).changeFavoritesModel!.massage,
              state: ToastStates.SUCCESS,
            );
          } else {
            showToast(
              msg: HomeCubit.get(context).changeFavoritesModel!.massage,
              state: ToastStates.ERROR,
            );
          }
        }
        if(state is SuccessChangeCartDateState){
          if(HomeCubit.get(context).changeCartModel!.status){
            showToast(
              msg: HomeCubit.get(context).changeCartModel!.massage,
              state: ToastStates.SUCCESS,
            );
          } else {
            showToast(
              msg: HomeCubit.get(context).changeCartModel!.massage,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (BuildContext context, state) {
        final homeModel = HomeCubit.get(context).homeModel;
        final categoriesModel = HomeCubit.get(context).categoriesModel;
        final favorites = HomeCubit.get(context).favorites;
        final changeFavorites = HomeCubit.get(context).changeFavorites;
        final cart = HomeCubit.get(context).cart;
        final changeCart = HomeCubit.get(context).changeCart;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Khourshed",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => homeModel != null && categoriesModel != null,
            fallbackBuilder: (context) => HomeLoading(),
            widgetBuilder: (context) => BuilderWidget(
              homeModel: (homeModel)!,
              categoriesModel: (categoriesModel)!,
              favorites: favorites,
              changeFavorites : changeFavorites,
              cart: cart,
              changeCart: changeCart,
            ),
          ),
        );
      },
    );
  }
}
