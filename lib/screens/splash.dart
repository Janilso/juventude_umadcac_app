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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                backgroundColor: primaryColor.withAlpha(70),
              ))
        ],
      ),
    );
  }
}
