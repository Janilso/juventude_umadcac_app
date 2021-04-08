import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/components/input_text.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

class VoluntaryScream extends StatefulWidget {
  @override
  _VoluntaryScreamState createState() => _VoluntaryScreamState();
}

class _VoluntaryScreamState extends State<VoluntaryScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputText(
              icon: FontAwesome.whatsapp,
              labelText: "Contato (WhatsApp)",
            )
          ],
        ),
      ),
    );
  }
}
