import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';

class CardIconTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final GestureTapCallback onTap;

  const CardIconTextWidget({
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
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowBlack, blurRadius: 20, spreadRadius: 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 50),
            SizedBox(height: 20),
            Text(
              text ?? '',
              style: AppTextStyles.h5Regular(color: AppColors.itemMenu),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
