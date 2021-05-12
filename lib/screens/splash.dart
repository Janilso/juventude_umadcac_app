import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/effect_curve.dart';
import 'package:juventude_umadcac_app/screens/home.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    Timer(
        Duration(milliseconds: 2500),
        () => {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => HomeScreen()))
            });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientApp),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: EffectCurve(
              child: Container(
                width: 200,
                child: Image.asset(ImagesAssets.logoVW),
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ))
        ],
      ),
    );
  }
}
