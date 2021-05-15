import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class LoadingWidget extends StatefulWidget {
  final double heightFactor;

  const LoadingWidget({Key key, this.heightFactor = 4}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  AnimationController _rotationController;
  AnimationController _rotationCtlCircles;

  @override
  void initState() {
    _rotationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _rotationCtlCircles = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    _rotationController.forward(from: 0.0);
    _rotationController.repeat(reverse: true);
    _rotationCtlCircles.forward(from: 0.0);
    _rotationCtlCircles.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: widget.heightFactor,
      child: Column(
        children: [
          RotationTransition(
            alignment: Alignment.bottomCenter,
            turns: Tween(begin: -0.1, end: 0.1).animate(CurvedAnimation(
              parent: _rotationController,
              curve: Curves.easeInOut,
            )),
            child: SvgPicture.asset(ImagesAssets.svgBible),
          ),
          SizedBox(height: 10),
          Container(
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCurcle(),
                _buildCurcle(main: true),
                _buildCurcle(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCurcle({bool main: false}) {
    double size = main ? 16.0 : 12.0;

    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _rotationCtlCircles,
          curve: Curves.easeInCubic,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              Container(color: main ? AppColors.yellow : AppColors.blueLight),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: size * 0.5,
                  color: main ? AppColors.yellowDark : AppColors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
