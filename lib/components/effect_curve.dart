import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum KindOfAnimation {
  forward,
  repeat,
  repeatAndreverse,
}

class EffectCurve extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final KindOfAnimation kindOfAnim;

  const EffectCurve({
    Key key,
    this.child,
    this.duration = const Duration(seconds: 1),
    this.kindOfAnim,
  }) : super(key: key);

  @override
  _EffectCurveState createState() => _EffectCurveState();
}

class _EffectCurveState extends State<EffectCurve>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final linearTween = Tween<double>(begin: 0, end: 1);

  void _playAnimation() {
    _controller.reset();
    if (widget.kindOfAnim == KindOfAnimation.forward) {
      _controller.forward();
    } else if (widget.kindOfAnim == KindOfAnimation.repeat) {
      _controller.repeat();
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _playAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Align(
          alignment: Alignment(
              0,
              lerpDouble(
                  0.2,
                  0,
                  linearTween
                      .chain(CurveTween(curve: Curves.linearToEaseOut))
                      .evaluate(_controller))),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
