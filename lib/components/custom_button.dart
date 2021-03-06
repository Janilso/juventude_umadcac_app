import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final IconData icon;
  final double width;

  const CustomButton(
      {Key key, this.text, this.onPressed, this.icon, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width != null
          ? width < 150
              ? 150
              : width
          : 200,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: gradientAppInverted,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: SizedBox.expand(
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    "$text",
                    style: TextStyles.h4Regular(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              icon != null
                  ? Container(
                      child: Icon(icon, color: Colors.white),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
