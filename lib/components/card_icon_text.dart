import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

class CardIconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final GestureTapCallback onTap;

  const CardIconText({
    Key key,
    @required this.icon,
    this.iconColor = Colors.red,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                blurRadius: 20,
                spreadRadius: 0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              text ?? '',
              style: TextStyle(fontSize: 18, color: colorItemMenu),
            )
          ],
        ),
      ),
    );
  }
}
