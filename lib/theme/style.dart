import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "Baloo",
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  indicatorColor: Colors.white,
  splashColor: Colors.white24,
  splashFactory: InkRipple.splashFactory,
  accentColor: Colors.white,
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

TextStyle textStyle = const TextStyle(
  color: const Color(0XFF000000),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
);

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.headline6.copyWith(),
  );
}

TextStyle textGreen = const TextStyle(
  color: const Color(0xFF00c497),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
);

TextStyle textPrimary = const TextStyle(
  color: Color(0xFFFFD428),
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
);

TextStyle textStyleSmall = const TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 12.0,
    fontWeight: FontWeight.bold);

TextStyle headingWhite = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

LinearGradient gradientApp = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [secondaryColor, primaryColor]);

final ThemeData base = ThemeData.light();

Color textFieldColor = const Color.fromRGBO(168, 160, 149, 0.6);
const Color primaryColor = const Color(0xFFFF005F);
const Color secondaryColor = const Color(0xFFF29200);
const Color transparentColor = const Color.fromRGBO(0, 0, 0, 0.2);
// const Color activeButtonColor = const Color.fromRGBO(43, 194, 137, 50.0);
// const Color dangerButtonColor = const Color(0XFFf53a4d);
