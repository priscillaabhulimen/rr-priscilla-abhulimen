import 'package:flutter/material.dart' show Color, MaterialColor;

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color.fromRGBO(249, 249, 248, 0.1),
    100: const Color.fromRGBO(249, 249, 248, 0.2),
    200: const Color.fromRGBO(249, 249, 248, 0.3),
    300: const Color.fromRGBO(249, 249, 248, 0.4),
    400: const Color.fromRGBO(249, 249, 248, 0.5),
    500: const Color.fromRGBO(249, 249, 248, 0.6),
    600: const Color.fromRGBO(249, 249, 248, 0.7),
    700: const Color.fromRGBO(249, 249, 248, 0.8),
    800: const Color.fromRGBO(249, 249, 248, 0.9),
    900: const Color.fromRGBO(249, 249, 248, 1),
  },
);

const MaterialColor fuschia = const MaterialColor(
  0x2E1A63,
  const <int, Color>{
    50: const Color.fromRGBO(238, 34, 149, 0.05),
    100: const Color.fromRGBO(238, 34, 149, 0.1),
    200: const Color.fromRGBO(238, 34, 149, 0.2),
    300: const Color.fromRGBO(238, 34, 149, 0.3),
    400: const Color.fromRGBO(238, 34, 149, 0.4),
    500: const Color.fromRGBO(238, 34, 149, 0.5),
    600: const Color.fromRGBO(238, 34, 149, 0.6),
    700: const Color.fromRGBO(238, 34, 149, 0.7),
    800: const Color.fromRGBO(238, 34, 149, 0.85),
    900: const Color.fromRGBO(238, 34, 149, 1),
  },
);

const MaterialColor darkPurple = const MaterialColor(
  0x2E1A63,
  const <int, Color>{
    50: const Color.fromRGBO(88, 85, 113, 0.05),
    100: const Color.fromRGBO(88, 85, 113, 0.1),
    200: const Color.fromRGBO(88, 85, 113, 0.2),
    300: const Color.fromRGBO(88, 85, 113, 0.3),
    400: const Color.fromRGBO(88, 85, 113, 0.4),
    500: const Color.fromRGBO(88, 85, 113, 0.5),
    600: const Color.fromRGBO(88, 85, 113, 0.6),
    700: const Color.fromRGBO(88, 85, 113, 0.7),
    800: const Color.fromRGBO(88, 85, 113, 0.85),
    900: const Color.fromRGBO(88, 85, 113, 1),
  },
);

class AppColors {
  AppColors._();

  static const Color primaryDark = Color(0xFF3F0526);
  static const Color primaryColor = Color(0xFFEE2295);
  static const Color primaryLight = Color(0xFFF25BAF);
  static const Color secondaryDark = Color(0xFF16151C);
  static const Color secondaryColor = Color(0xFF585571);
  static const Color secondaryLight = Color(0xFF07D7A9B);
  static const Color mainWhite= Color(0xFFF9F9F8);
}
