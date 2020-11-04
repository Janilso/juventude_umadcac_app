import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const CustomAppBar({Key key, this.title})
      : preferredSize = const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 15),
          child: IconButton(
            tooltip: "Menu",
            icon: Icon(Feather.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: title != null
              ? Text(title)
              : Image.asset(
                  ImagesAssets.logoHW,
                  height: 40,
                ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradientApp),
        ),
      ),
    );
  }
}
