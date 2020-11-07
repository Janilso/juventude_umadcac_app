import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';
import 'package:package_info/package_info.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  PackageInfo packageInfo = PackageInfo(
    appName: null,
    packageName: null,
    version: null,
    buildNumber: null,
  );

  @override
  void initState() {
    _getDataApp();
    super.initState();
  }

  Future<void> _getDataApp() async {
    final PackageInfo info = await PackageInfo.fromPlatform();

    setState(() {
      packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: grey))),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Image.asset(ImagesAssets.logoHC),
              ),
              Expanded(
                child: ScrollShadowContainer(
                  elevation: MaterialElevation.the8dp,
                  child: ListView(
                    children: [
                      _buildItemMenu(
                          icon: Feather.home, text: "Início", isActive: true),
                      _buildItemMenu(icon: Feather.calendar, text: "Agenda"),
                      _buildItemMenu(
                          icon: Feather.user_plus, text: "Cadastro Umadcac"),
                      _buildItemMenu(
                          icon: Feather.award, text: "Seja um Voluntário"),
                      _buildItemMenu(
                          icon: Feather.map_pin, text: "Como Chegar"),
                      _buildItemMenu(
                          icon: Feather.music, text: "Repertório Umadcac 2021"),
                      _buildItemMenu(
                          icon: Feather.message_circle, text: "Fale Conosco"),
                      _buildItemMenu(icon: Feather.facebook, text: "Facebook"),
                      _buildItemMenu(icon: Feather.youtube, text: "YouTube"),
                      Divider(height: 0, thickness: 1, color: grey),
                      _buildItemMenu(
                          icon: Feather.file_text, text: "Termos de Uso"),
                      _buildItemMenu(
                          icon: Feather.file_text,
                          text: "Política de Privacidade"),
                      Divider(height: 0, thickness: 1, color: grey),
                      _buildFooter(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemMenu(
      {IconData icon = Icons.warning,
      String text = 'Name',
      bool isActive = false,
      onPressed}) {
    return FlatButton(
      onPressed: onPressed ?? () {},
      color: isActive ? activeMenuColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      padding: EdgeInsets.only(left: 10),
      // onTap: onTap,
      child: ListTile(
        // tileColor: isActive ? activeMenuColor : Colors.transparent,
        leading: Icon(
          icon,
          size: 22,
          color: isActive ? Colors.white : iconItemMenuColor,
        ),
        title: Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Baloo",
                fontSize: 17,
                color: isActive ? Colors.white : textItemMenuColor),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesAssets.iconC,
            height: 50,
          ),
          Container(
            height: 75,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: VerticalDivider(
              color: grey,
              thickness: 1,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                packageInfo?.appName ?? "Umadcac",
                style: TextStyle(
                  fontFamily: "Baloo",
                  fontWeight: FontWeight.w700,
                  color: greyDark,
                ),
              ),
              Text("Versão ${packageInfo?.version ?? '-'}",
                  style: TextStyle(
                    fontFamily: "Baloo",
                    color: greyDark,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
