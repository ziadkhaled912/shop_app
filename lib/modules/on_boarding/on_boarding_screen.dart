

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_final/modules/home_layout/home_layout.dart';
import 'package:shop_app_final/modules/login/login_screen.dart';
import 'package:shop_app_final/modules/register/register_screen.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:shop_app_final/shared/network/local/cache_helper.dart';
import 'package:shop_app_final/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  final bool last;
  BoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
    this.last = false,
  });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

    // boarding list
    List<BoardingModel> boarding = [
      BoardingModel(
          image: "assets/images/onboard_1.png",
          title: "Welcome To Khourshed",
          body: 'Khourshed Store is on the way to serve you',
      ),
      BoardingModel(
          image: "assets/images/onboard_1.png",
          title: "Title 2",
          body: 'subtitle 2',
      ),
      BoardingModel(
          image: "assets/images/onboard_1.png",
          title: "Let's Get Started",
          body: 'subtitle 3',
        last: true,
      ),
    ];

    PageController boardController = PageController(); // PageView Controller

    bool isLast = false;

    void loginSubmit() {
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        if(value) {
          navigateToAndFinish(context, LoginScreen());
        }
      });
    }
    void registerSubmit() {
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        if(value) {
          navigateToAndFinish(context, RegisterScreen());
        }
      });
    }
    void doneSubmit() {
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        if(value) {
          navigateToAndFinish(context, HomeLayout());
        }
      });
    }
    @override
    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'عربية',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                          // textAlign: TextAlign.right,
                        ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (int index) {
                    if(index == boarding.indexOf(boarding.last)) {
                      setState(() {
                        isLast = true;
                      });
                    }
                    else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        boardController.animateToPage(
                          boarding.indexOf(boarding.last),
                          duration: Duration(
                            milliseconds: 700,
                          ),
                          curve: Curves.easeInOutQuad,
                        );
                      },
                      child: isLast ? Container() :
                      Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                  ),
                  ),
                  Expanded(
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: primaryColor,
                          dotHeight: 10,
                          dotWidth: 10,
                          expansionFactor: 4,
                          spacing: 5,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if(isLast){
                          doneSubmit();
                        } else {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 700,
                            ),
                            curve: Curves.easeInOutQuad,
                          );
                        }
                      },
                      child: isLast ? Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ) : Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${model.title}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Image(
              image: AssetImage('${model.image}'),
            ),
            SizedBox(height: 50),
            if(model.last)
              Column(
                children: [
                  defaultButton(
                    onPressed: () {
                      loginSubmit();
                    },
                    text: 'sign in',
                    height: 48,
                    border: Colors.black,
                    isUpperCase: true,
                  ),
                  SizedBox(height: 20),
                  defaultButton(
                    onPressed: () {
                      registerSubmit();
                    },
                    text: 'create account',
                    height: 50,
                    isUpperCase: true,
                    background: primaryColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            if(model.last == false)
                Text(
                  '${model.body}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
            SizedBox(height: 50),
          ],
        ),
  );
}
