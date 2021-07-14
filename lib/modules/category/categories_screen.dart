import 'package:flutter/material.dart';
import 'package:shop_app_final/modules/category/category_item_bulider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_final/shared/componants/loading_components/categories_loading/categories_screen_loading.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        final categoriesModel = HomeCubit.get(context).categoriesModel;

        return Scaffold(
          appBar: AppBar(
            title : Text("Categories",),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => categoriesModel != null,
            fallbackBuilder: (BuildContext context) => CategoriesScreenLoading(),
            widgetBuilder: (BuildContext context) =>  ListView.separated(
              itemBuilder: (context, index) => CategoryItemBuilder(
                categoriesModel: (categoriesModel)!,
                index: index,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemCount: categoriesModel!.data!.categories.length,
            ),
          ),
        );
      },
    );
  }
}