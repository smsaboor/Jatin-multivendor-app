import 'package:flutter/material.dart';

class MyConstant {
  static const defaultPadding = 16.0;
  static const primaryColor = Color(0xFFFF4E1B);
  static const white = Color(0xFFFFFFFE);
  static const black = Color(0xFF0F0F0F);
  static const grey = Color(0xFFABABAB);
  static const green = Color(0xFF0B530A);
  static const myblack = Color(0xFF000000);
}

class MyTextStyles {
  static const TextStyle onboardingStyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: Color(0XFF000000));
  static const TextStyle onboardingGreyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0XFF3F3E3E),
  );

  static const TextStyle notificationText =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const TextStyle incomeText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF2CB22C));
  static const TextStyle expenseText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFED1E24));

  static const TextStyle loginHeadingText = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF272727));
  static const TextStyle logoText = TextStyle(
      fontSize: 37,
      fontWeight: FontWeight.w600,
      color: MyConstant.primaryColor);

  static const TextStyle skipText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w500, color: Color(0XFFFFFFFF));

  static const TextStyle blockText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF000000));
  static const TextStyle subTitleText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF000000));

  static const TextStyle drawerContainerText = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF));
  static const TextStyle drawerSecText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF000000));
  static const TextStyle dummyTextStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF000000));
  static const TextStyle appBarText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0XFF383838),
  );
}
