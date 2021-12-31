import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get subtitle2 {
    return TextStyle(
      fontSize: 10,
      color: AppColors.mainWhite
    );
  }

  static TextStyle get subtitle1 {
    return TextStyle(
        fontSize: 13.5,
        color: AppColors.mainWhite
    );
  }

  static TextStyle get title1 {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: AppColors.mainWhite,
    );
  }
  static TextStyle get title2 {
    return TextStyle(
      fontSize: 17.5,
      fontWeight: FontWeight.bold,
      color: AppColors.mainWhite,
    );
  }
}
