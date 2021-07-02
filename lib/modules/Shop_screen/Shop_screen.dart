import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/Shop_screen/builder_widget.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var homeModel = HomeCubit.get(context).homeModel;
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
            conditionBuilder: (context) => homeModel != null,
            fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),
            widgetBuilder: (context) => BuilderWidget(model: homeModel),
          ),
        );
      },
    );
  }
}
