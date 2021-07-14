import 'package:shop_app_final/modules/login/login_screen.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:shop_app_final/shared/network/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token',).then((value) {
    if(value) {
      navigateToAndFinish(context, LoginScreen());
    }
  });
}

// Print full text
void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// token
String? token;