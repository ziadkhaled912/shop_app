import 'package:flutter/material.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_final/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // cubit object
          var cubit = HomeCubit.get(context);

          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              selectedItemColor: primaryColor,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps,
                  size: 27,
                  ),
                  label: "categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,
                    size: 27,
                  ),
                  label: "favorite",
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.shoppingCart,
                  size: 22,
                  ),
                  label: "search",
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.userAlt),
                  label: "settings",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
