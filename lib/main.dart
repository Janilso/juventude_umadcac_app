import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/screens/splash.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Juventude UMADCAC 2021',
      theme: appTheme,
      home: SplashPage(),
    );
  }
}
