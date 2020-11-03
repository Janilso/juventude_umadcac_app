import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/screens/splash.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juventude UMADCAC',
      theme: appTheme,
      home: SplashPage(),
    );
  }
}
