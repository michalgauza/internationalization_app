import 'package:flutter/material.dart';

class AppColors{
  static const MaterialColor materialGrey = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFF686868),
      100: Color(0xFF606060),
      200: Color(0xFF505050),
      300: Color(0xFF484848),
      400: Color(0xFF383838),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF282828),
      700: Color(0xFF202020),
      800: Color(0xFF181818),
      900: Color(0xFF000000),
    },
  );
  static const int _grayPrimaryValue = 0xFF303030;
}
