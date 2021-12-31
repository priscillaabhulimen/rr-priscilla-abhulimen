import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get subtitle {
    return TextStyle(
      fontSize: 10,
      color: AppColors.mainWhite
    );
  }

  static TextStyle get title {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.mainWhite,
    );
  }
}
