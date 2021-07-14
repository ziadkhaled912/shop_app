import 'package:flutter/material.dart';
import 'package:shop_app_final/shared/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Navigate to Screen function
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// Navigate to Screen and replacement function
void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

// Default app button
Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  Color background = Colors.transparent,
  Color border = Colors.transparent,
  required void Function() onPressed,
  required String text,
  bool isUpperCase = true,
  Color textColor = Colors.black,
  double fontSize = 15,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: background,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            width: 1.5,
            color: border,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          isUpperCase ? '$text'.toUpperCase() : '$text',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );

// Social app button
Widget socialButton({
  required String assetName,
  double width = double.infinity,
  double height = 50,
  Color background = Colors.transparent,
  Color border = Colors.transparent,
  required void Function() onPressed,
  required String text,
  bool isUpperCase = true,
  Color textColor = Colors.black,
  double fontSize = 15,
  bool isCenter = true,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: background,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            width: 1.5,
            color: border,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              assetName,
            ),
            Text(
              isUpperCase ? '$text'.toUpperCase() : '$text',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            if (isCenter)
              Opacity(
                opacity: 0,
                child: Image.asset(assetName),
              ),
          ],
        ),
      ),
    );

// default text form field
Widget defaultFormField({
  String? labelText,
  required TextEditingController controller,
  required String? Function(String?) validation,
  TextInputType? type,
  Icon? prefix,
  IconData? suffix,
  String? hintText,
  Function(String)? onSubmit,
  void Function()? onTape,
  bool secure = false,
  Function? suffixPressed,
  bool isClickable = true,
  Function(String)? onChanged,
  TextInputAction? actionBtn,
}) =>
    TextFormField(
      validator: validation,
      cursorColor: primaryColor,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefix,
        suffixIcon: IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(suffix),
        ),
      ),
      keyboardType: type,
      textInputAction: actionBtn,
      onTap: onTape,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      obscureText: secure,
      onChanged: onChanged,
    );

// Default text button
Widget defaultTextButton({
  required String text,
  required void Function() onPressed,
  double? fontSize,
  FontWeight? fontWeight,
  Color? textColor,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        '$text',
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );

// Toast
void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

// Titles
Widget titleWidget({
  required String text,
  Color? color,
}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: 22, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
);

// Quantity button
Widget defaultQuantityBtn({
  required String text,
  required context,
}) => InkWell(
  onTap: () {

  },
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  child: Container(
    width: 60,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: (Colors.grey[300])!,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(
          text,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
      ],
    ),
  ),
);