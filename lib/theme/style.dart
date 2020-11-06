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
const Color primaryColor = _pink;
const Color secondaryColor = _orange;
const Color transparentColor = const Color.fromRGBO(0, 0, 0, 0.2);
const Color activeIndicatorColor = _black;
const Color indicatorColor = _grey;
const Color bgSlider = _greyLight;
const Color defaultColor = _black;
const Color shadowBlack = _blackShadow;
const Color colorItemMenu = _blue;
const Color red = _red;
const Color yellow = _yellow;
const Color blueLight = _blueLight;
const Color orange = _orange;

// const Color activeButtonColor = const Color.fromRGBO(43, 194, 137, 50.0);
// const Color dangerButtonColor = const Color(0XFFf53a4d);

/* 
 * Colors Name
 */

const Color _pinkLight = Color(0xFFFF81E6);
const Color _pink = Color(0xFFFF005F);
const Color _blueLight = Color(0xFF55A7D9);
const Color _blue = Color(0xFF2D6DB4);
const Color _blueDark = Color(0xFF002D63);
const Color _yellow = Color(0xFFFBD900);
const Color _orange = Color(0xFFF29200);
const Color _red = Color(0xFF002D63);
const Color _greyLight = Color(0xFFEFEFEF);
const Color _grey = Color(0xFFDCDCDC);
const Color _greyDark = Color(0xFFA2A2A2);
const Color _black = Color(0xFF000000);
const Color _blackShadow = Color.fromRGBO(0, 0, 0, 0.15);
const Color _green = Color(0xFF44AC32);
