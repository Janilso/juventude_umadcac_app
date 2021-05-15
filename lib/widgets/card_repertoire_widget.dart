import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';

class CardRepertoireWidget extends StatelessWidget {
  final IconData iconRight;
  final IconData iconLeft;
  final String title;
  final String subtitle;
  final Function onTap;

  const CardRepertoireWidget({
    Key key,
    this.iconRight = Feather.music,
    this.iconLeft = Feather.chevron_right,
    this.title = "",
    this.subtitle = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: AppColors.gradientAppInverted,
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            padding: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                border:
                    Border(right: BorderSide(width: 1.0, color: Colors.white))),
            child: Center(child: Icon(iconRight, color: Colors.white)),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h5Bold()),
              SizedBox(height: 2),
              Text(subtitle, style: AppTextStyles.h5Regular())
            ],
          ),
          trailing: Container(
              width: 30,
              child: Center(child: Icon(iconLeft, color: Colors.white))),
        ),
      ),
    );
  }
}