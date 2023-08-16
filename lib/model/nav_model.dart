import 'package:flutter/material.dart';

class MyModel {
  final String imgSrc;
  final String text;
  final String?  secondText;
  final Widget? onTap;

  MyModel({
    required this.imgSrc,
    required this.text,
    this.onTap,
     this.secondText = "",
  });
}
