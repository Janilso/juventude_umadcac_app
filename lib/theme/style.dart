import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "Baloo",
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  indicatorColor: Colors.white,
  splashColor: Colors.white24,
  splashFactory: InkRipple.splashFactory,
  // accentColor: Colors.white,
  accentColor: Colors.red,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  errorColor: Color(0xFFB00020),
  highlightColor: primaryColor,
  iconTheme: IconThemeData(color: primaryColor),
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

LinearGradient gradientApp = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [secondaryColor, pink]);

LinearGradient gradientAppInverted = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [secondaryColor, pink]);

LinearGradient gradientAppDesabled = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [secondaryColor.withOpacity(0.6), pink.withOpacity(0.6)]);

final ThemeData base = ThemeData.light();

Color textFieldColor = const Color.fromRGBO(168, 160, 149, 0.6);
const Color primaryColor = _blueDark;
const Color secondaryColor = _orange;
const Color transparentColor = const Color.fromRGBO(0, 0, 0, 0.2);
const Color activeIndicatorColor = _black;
const Color indicatorColor = _grey;
const Color bgSlider = _greyLight;
const Color defaultColor = _black;
const Color shadowBlack = _blackShadow;
const Color colorItemMenu = _blue;
const Color red = _red;
const Color redLight = _redLight;
const Color redExtraLight = _redExtraLight;
const Color yellow = _yellow;
const Color blueLight = _blueLight;
const Color orange = _orange;
const Color greyLight = _greyLight;
const Color grey = _grey;
const Color greyDark = _greyDark;
const Color activeMenuColor = _blueDark;
const Color iconItemMenuColor = _blueLight;
const Color textItemMenuColor = _blueDark;
const Color colorCardJobTitles = _blueDark;
const Color green = _green;
const Color greenLight = _greenLight;
const Color beige = _beige;
const Color purple = _purple;
const Color blue = _blue;
const Color pink = _pink;

/* 
 * Colors Name
 */
const Color _pinkLight = Color(0xFFFF81E6);
const Color _pink = Color(0xFFFF005F);
const Color _blueExtraLight = Color(0xFFF3F6FF);
const Color _blueLight = Color(0xFF55A7D9);
const Color _blue = Color(0xFF2D6DB4);
const Color _blueDark = Color(0xFF002D63);
const Color _yellow = Color(0xFFFFE470);
const Color _orangeLight = Color(0xFFFFC473);
const Color _orange = Color(0xFFF29200);
const Color _redExtraLight = Color(0xFFFFF9F9);
const Color _redLight = Color(0xFFF15B5E);
const Color _red = Color(0xFFDC0105);
const Color _greyLight = Color(0xFFF2F2F2);
const Color _grey = Color(0xFFBDBDBD);
const Color _greyDark = Color(0xFFA2A2A2);
const Color _purple = Color(0xFFB255DF);
const Color _black = Color(0xFF323232);
const Color _blackShadow = Color.fromRGBO(0, 0, 0, 0.10);
const Color _green = Color(0xFF3FC367);
const Color _greenLight = Color(0xFF60D483);
const Color _beige = Color(0xFFB255DF);
