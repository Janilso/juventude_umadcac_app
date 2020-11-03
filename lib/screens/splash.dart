import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/effect_curve/effect_curve.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  // AnimationController _animationCtr;
  // Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Timer(Duration(seconds: 4), ()=>Mate)

    // _animationCtr = AnimationController(
    //     duration: const Duration(milliseconds: 10000),
    //     vsync: this,
    //     value: 0,
    //     lowerBound: 0,
    //     upperBound: 1);
    // _animation =
    //     CurvedAnimation(parent: _animationCtr, curve: Curves.fastOutSlowIn);
    // // _animation =
    // //     Tween(begin: );
    // _animationCtr.forward();
  }

  @override
  void dispose() {
    // _animationCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [secondaryColor, primaryColor])),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // FadeTransition(
          //   opacity: _animation,
          //   child: ,
          // ),

          Center(
            child: EffectCurve(
              child: Container(
                width: 200,
                child: Image.asset(ImagesAssets.logoVW),
              ),
            ),
          ),

          // FadeTransition(
          //   opacity: _animation,
          //   child: Center(
          //     child: Container(
          //       width: 200,
          //       child: Image.asset(ImagesAssets.logoVW),
          //     ),
          //   ),
          // ),
          Positioned(
              bottom: 100,
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
              ))
        ],
      ),
    );
  }
}
