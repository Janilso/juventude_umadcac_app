import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const CustomAppBar({Key key, this.title})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    // bool hasPop = Navigator.canPop(context);
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        // automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: EdgeInsets.only(top: 15),
        //   child: IconButton(
        //     tooltip: "Menu",
        //     icon: Icon(hasPop ? Feather.arrow_left : Feather.menu),
        //     onPressed: () {
        //       hasPop
        //           ? Navigator.pop(context)
        //           : Scaffold.of(context).openDrawer();
        //     },
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        title: title != null
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: TextStyles.h3SemiBold(),
                ),
              )
            : Image.asset(
                ImagesAssets.logoHW,
                height: 30,
              ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppColors.gradientApp),
        ),
      ),
    );
  }
}
