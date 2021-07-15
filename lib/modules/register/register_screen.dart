import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_final/modules/home_layout/home_layout.dart';
import 'package:shop_app_final/modules/login/cubit/cubit.dart';
import 'package:shop_app_final/modules/login/cubit/states.dart';
import 'package:shop_app_final/modules/login/login_screen.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:shop_app_final/shared/componants/constants.dart';
import 'package:shop_app_final/shared/network/local/cache_helper.dart';
import 'package:shop_app_final/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class RegisterScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state)
        {
          if(state is LoginSuccessState)
          {
            if(state.loginModel.status) {
              showToast(
                msg: (state.loginModel.message)!,
                state: ToastStates.SUCCESS,
              );

              CacheHelper.saveData(
                key: "token",
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token;
                navigateToAndFinish(context, HomeLayout());
              });
            } else {
              showToast(
                msg: (state.loginModel.message)!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state)
        {
          final formKey = GlobalKey<FormState>();
          final cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Register'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              centerTitle: true,
              backgroundColor: backgroundColor,
              brightness: Brightness.light,
              backwardsCompatibility: false,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: backgroundColor,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 25,
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                'Create your account',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'After your registration is complete,\n you can see our premium products.',
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: socialButton(
                                      assetName: 'assets/images/Icons-icon-google.png',
                                      onPressed: () {},
                                      text: 'Google',
                                      isUpperCase: false,
                                      border: Color(0xFFDE4D3B),
                                      textColor: Color(0xFFDE4D3B),
                                      fontSize: 14,
                                      width: 140,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: socialButton(
                                      assetName: 'assets/images/Icons-icon-facebook.png',
                                      onPressed: () {},
                                      text: 'Facebook',
                                      isUpperCase: false,
                                      fontSize: 14,
                                      border: Color(0xFF4267B2),
                                      textColor: Color(0xFF4267B2),
                                      width: 140,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 1.5,
                                    width: 50,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Colors.grey[400]
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    height: 1.5,
                                    width: 50,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                              defaultFormField(
                                controller: nameController,
                                validation: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'please enter your full name';
                                  }
                                },
                                labelText: 'Full Name',
                                type: TextInputType.name,
                                actionBtn: TextInputAction.next,
                              ),
                              SizedBox(height: 10),
                              defaultFormField(
                                controller: phoneController,
                                validation: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'please enter your phone';
                                  }
                                },
                                labelText: 'Phone Number',
                                type: TextInputType.phone,
                                actionBtn: TextInputAction.next,
                              ),
                              SizedBox(height: 10),
                              defaultFormField(
                                controller: emailController,
                                validation: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'please enter your email address';
                                  }
                                },
                                labelText: 'Email Address',
                                type: TextInputType.emailAddress,
                                actionBtn: TextInputAction.next,
                              ),
                              SizedBox(height: 10),
                              defaultFormField(
                                  controller: passwordController,
                                  validation: (value) {
                                    if(value == null || value.isEmpty){
                                      return 'Password is too short';
                                    }
                                  },
                                  labelText: 'Password',
                                  type: TextInputType.text,
                                  secure: cubit.isSecure,
                                  suffix: cubit.suffix,
                                  suffixPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                              ),
                              SizedBox(height: 30 ),
                              Conditional.single(
                                context: context,
                                conditionBuilder: (context) => state is! LoginLoadingState,
                                widgetBuilder:(context) => defaultButton(
                                  text: 'sign up',
                                  isUpperCase: true,
                                  background: primaryColor,
                                  textColor: Colors.white,
                                  height: 50,
                                  onPressed: ()
                                  {
                                    if(formKey.currentState != null && formKey.currentState!.validate()){
                                      cubit.userRegister(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                ),
                                fallbackBuilder: (BuildContext context) => Center(
                                  child:  Column(
                                    children: [
                                      CupertinoActivityIndicator(
                                        radius: 18,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Loading',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                ),
                                defaultTextButton(
                                  text: 'Sign In',
                                  fontWeight: FontWeight.bold,
                                  textColor: primaryColor,
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      LoginScreen(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
