import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';

class CardJobTitles extends StatelessWidget {
  final String jobTitle;
  final String name;

  const CardJobTitles({Key key, @required this.jobTitle, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.cardJobTitles,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowBlack, blurRadius: 20, spreadRadius: 0)
          ]),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child:
                  Icon(Feather.user, color: AppColors.cardJobTitles, size: 40),
            ),
            SizedBox(height: 15),
            Text(
              jobTitle ?? '',
              style: AppTextStyles.h6Bold(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              name ?? '',
              style: AppTextStyles.h6Regular(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
