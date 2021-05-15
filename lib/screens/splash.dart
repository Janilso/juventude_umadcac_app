import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/widgets/effect_curve_widget.dart';
import 'package:juventude_umadcac_app/screens/home.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.gradientApp),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: EffectCurveWidget(
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
