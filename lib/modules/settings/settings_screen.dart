import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/models/login_model.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_final/modules/settings/update_profile_screen.dart';
import 'package:shop_app_final/shared/componants/constants.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          final LoginModel? userModal = HomeCubit.get(context).userModel;
          final Function updateProfile = HomeCubit.get(context).updateUser;
          const keyLanguage = 'key-language';
          return Scaffold(
            appBar: AppBar(
              title : Text("Settings",),
            ),
            body: ListView(
              // padding: EdgeInsets.all(16),
              children:
              [
                SettingsGroup(
                  title: 'Profile Settings',
                  children:
                  [
                    SizedBox(height: 15),
                    SimpleSettingsTile(
                      title: 'Ziad Khaled',
                      subtitle: '+201146446721',
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                          child: FaIcon(FontAwesomeIcons.userAlt,color: Colors.white,size: 20,),
                      ),
                      onTap: () {},
                      enabled: false,
                    ),
                    SimpleSettingsTile(
                      title: 'Update Profile',
                      subtitle: '',
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.system_update_alt_outlined, color: Colors.grey,
                          )
                      ),
                      onTap: () {},
                      child: userModal != null? UpdateProfileScreen(
                        modal: userModal,
                        updateProfile: updateProfile,
                      ): null,
                    ),
                    SimpleSettingsTile(
                      title: 'Logout',
                      subtitle: '',
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.logout, color: Colors.grey,)
                      ),
                      child: Container(),
                      onTap: () {
                        signOut(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SettingsGroup(
                  title: 'App Settings',
                  children:
                  [
                    SizedBox(height: 15),
                    SimpleSettingsTile(
                      title: 'Languages',
                      subtitle: '',
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.language, color: Colors.grey,size: 26,),
                      ),
                      onTap: () {},
                      enabled: false,
                    ),
                    SwitchSettingsTile(
                      settingKey: 'key-dark-mode',
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.dark_mode_outlined, color: Colors.grey,),
                      ),
                      title: 'Dark Mode',
                    ),
                    DropDownSettingsTile(
                      settingKey: keyLanguage,
                      title: 'Language',
                      selected: 1,
                      values: <int, String>{
                        1: 'English',
                        2: 'Arabic',
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}