import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "Baloo",
  primaryColor: AppColors.primary,
  buttonColor: AppColors.primary,
  indicatorColor: Colors.white,
  splashColor: Colors.white24,
  splashFactory: InkRipple.splashFactory,
  // accentColor: Colors.white,
  accentColor: Colors.red,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  errorColor: Color(0xFFB00020),
  highlightColor: AppColors.primary,
  iconTheme: IconThemeData(color: AppColors.primary),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: _buildTextTheme(base.textTheme),
  primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  accentTextTheme: _buildTextTheme(base.accentTextTheme),
);

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.headline6.copyWith(),
  );
}

final ThemeData base = ThemeData.light();
