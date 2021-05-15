import 'package:flutter/painting.dart';

class AppColors {
  static Color _pinkLight = Color(0xFFFF81E6);
  static Color _pink = Color(0xFFFF005F);

  static Color _blueExtraLight = Color(0xFFF3F6FF);
  static Color _blueLight = Color(0xFF55A7D9);
  static Color _blue = Color(0xFF2D6DB4);
  static Color _blueDark = Color(0xFF002D63);

  static Color _yellowDark = Color(0xFFFBD900);
  static Color _yellow = Color(0xFFFFE470);

  static Color _orangeExtraLight = Color(0xFFFBDEB2);
  static Color _orangeLight = Color(0xFFFFC473);
  static Color _orange = Color(0xFFF29200);

  static Color _redExtraLight = Color(0xFFFFF9F9);
  static Color _redLight = Color(0xFFF15B5E);
  static Color _red = Color(0xFFDC0105);

  static Color _greyLight = Color(0xFFF2F2F2);
  static Color _grey = Color(0xFFBDBDBD);
  static Color _greyDark = Color(0xFFA2A2A2);

  static Color _black = Color(0xFF323232);
  static Color _blackShadow = Color.fromRGBO(0, 0, 0, 0.10);

  static Color _green = Color(0xFF3FC367);
  static Color _greenLight = Color(0xFF60D483);

  static Color _purple = Color(0xFFB255DF);
  static Color _beige = Color(0xFFB255DF);

  static final Color textField = const Color.fromRGBO(168, 160, 149, 0.6);
  static final Color primary = _blueDark;
  static final Color secondary = _orange;
  static final Color transparent = const Color.fromRGBO(0, 0, 0, 0.2);
  static final Color activeIndicator = _black;
  static final Color indicator = _grey;
  static final Color bgSlider = _greyLight;
  static final Color defaultColor = _black;
  static final Color shadowBlack = _blackShadow;
  static final Color itemMenu = _blue;
  static final Color red = _red;
  static final Color redLight = _redLight;
  static final Color redExtraLight = _redExtraLight;
  static final Color yellowDark = _yellowDark;
  static final Color yellow = _yellow;
  static final Color blueLight = _blueLight;
  static final Color orange = _orange;
  static final Color greyLight = _greyLight;
  static final Color grey = _grey;
  static final Color greyDark = _greyDark;
  static final Color activeMenu = _blueDark;
  static final Color iconItemMenu = _blueLight;
  static final Color textItemMenu = _blueDark;
  static final Color cardJobTitles = _blueDark;
  static final Color green = _green;
  static final Color greenLight = _greenLight;
  static final Color beige = _beige;
  static final Color purple = _purple;
  static final Color blue = _blue;
  static final Color pink = _pink;
  static final Color orangeExtraLight = _orangeExtraLight;

  static final LinearGradient gradientApp = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [secondary, pink]);

  static final LinearGradient gradientAppInverted = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [secondary, pink]);

  static final LinearGradient gradientAppDesabled = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [secondary.withOpacity(0.6), pink.withOpacity(0.6)]);
}
