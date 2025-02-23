import 'package:flutter/material.dart';
import 'package:todo/constants/color.dart';

class AppTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Poppins",
      primarySwatch: colorCustom,
      primaryColor: colorCustom,
    );
  }

  // Dark theme is inclided in the Full template
}
