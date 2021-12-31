import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get label {
    return TextStyle(
      fontSize: 10,
      color: AppColors.mainWhite
    );
  }

  static TextStyle get input {
    return TextStyle(
      fontSize: 14,
      color: Colors.black,
    );
  }
}
