import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_final/models/favorites_model.dart';
import 'package:shop_app_final/modules/favourites/favourites_item_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class FavouritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getFavorites(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          final FavoritesModel? favoritesModel = HomeCubit.get(context).favouritesModel;
          final deleteFavorite = HomeCubit.get(context).changeFavorites;
          return Scaffold(
            appBar: AppBar(
              title : Text("My Favourites"),
            ),
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => favoritesModel != null,
              fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),
              widgetBuilder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 1,
                          color: (Colors.grey[200])!,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${favoritesModel!.data.data.length} items',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => FavouriteItemBuilder(
                        favoritesData: favoritesModel.data.data[index],
                        deleteFavorite: deleteFavorite,
                      ),
                      separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      itemCount: favoritesModel.data.data.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}