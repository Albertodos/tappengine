import 'package:flutter/material.dart';

class AppColors {
  static const blue = Color.fromRGBO(34, 86, 165, 1);
  static const gray = Color.fromRGBO(251, 249, 255, 1);
  static const gray0 = Color.fromRGBO(240, 242, 249, 1);
  static const gray1 = Color.fromRGBO(229, 221, 244, 1);
  static const gray2 = Color.fromRGBO(110, 117, 124, 1);
  static const gray3 = Color.fromRGBO(240, 237, 246, 1);

  static const green = Color.fromRGBO(65, 155, 33, 1);
  static const red = Color.fromRGBO(255, 65, 65, 1);
  static const purpura = Color.fromRGBO(82, 44, 108, 1);
  static const purpura1 = Color.fromRGBO(139, 13, 110, 1);
  static const purpura2 = Color.fromRGBO(150, 104, 203, 1);
  static const purpura4 = Color.fromRGBO(174, 149, 218, 1);
  static const purpura3 = Color(0xFFE5DDF4);

  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
