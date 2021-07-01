import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.get(context);
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
            conditionBuilder: (context) => cubit.homeModel != null,
            fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),
            widgetBuilder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children:
                [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: new Swiper(
                      itemCount: cubit.homeModel.data.banners.length,
                      pagination: new SwiperPagination(),
                      itemBuilder: (BuildContext context,int index){
                        return new Image.network("${cubit.homeModel.data.banners[index].image}",fit: BoxFit.fill,);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
