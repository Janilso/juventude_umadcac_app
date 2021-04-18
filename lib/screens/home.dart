import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/components/card_icon_text.dart';
import 'package:juventude_umadcac_app/components/carousel_images.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/components/versicle_day.dart';
import 'package:juventude_umadcac_app/screens/about.dart';
import 'package:juventude_umadcac_app/screens/calendar.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1000&h=2500&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1000&h=2500&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1000&h=2500&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1000&h=2500&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1000&h=2500&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1000&h=2500&q=80'
];

class HomeScream extends StatefulWidget {
  @override
  _HomeScreamState createState() => _HomeScreamState();
}

class _HomeScreamState extends State<HomeScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              color: bgSlider,
              child: CarouselImages(images: imgList),
            ),
            VersicleDay(),
            Center(
              child: Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  padding:
                      EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 40),
                  children: [
                    CardIconText(
                      icon: Feather.calendar,
                      text: "Agenda",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarScreen()));
                      },
                    ),
                    CardIconText(
                      icon: Feather.music,
                      iconColor: purple,
                      text: "Repertório",
                      onTap: () {},
                    ),
                    CardIconText(
                      icon: Feather.award,
                      iconColor: yellow,
                      text: "Ser Voluntário",
                      onTap: () {},
                    ),
                    CardIconText(
                      icon: Feather.info,
                      iconColor: blueLight,
                      text: "Sobre",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                    ),
                    CardIconText(
                      icon: Feather.message_circle,
                      iconColor: green,
                      text: "Fale Conosco",
                      onTap: () {},
                    ),
                    CardIconText(
                      icon: Feather.file_text,
                      iconColor: blue,
                      text: "Política de Privacidade",
                      onTap: () {},
                    ),
                    CardIconText(
                      icon: Feather.file_text,
                      iconColor: blue,
                      text: "Termos de Uso",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
