import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/models/repertorio.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';

class DetailHymnScreen extends StatefulWidget {
  final Hino hino;

  const DetailHymnScreen({Key key, this.hino}) : super(key: key);

  @override
  _DetailHymnScreenState createState() => _DetailHymnScreenState();
}

class _DetailHymnScreenState extends State<DetailHymnScreen> {
  double _fontSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "REPERTÓRIO"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                activeColor: secondaryColor,
                inactiveColor: orangeExtraLight,
                value: _fontSize,
                min: 20,
                max: 40,
                divisions: 10,
                label: _fontSize.round().toString(),
                onChanged: (double value) => setState(() => _fontSize = value),
              ),
              SizedBox(height: 30),
              Text(widget.hino?.nome ?? '',
                  style: TextStyles.h3Bold(color: defaultColor)),
              Text(
                widget.hino?.autoria ?? '',
                style: TextStyles.h5Regular(color: defaultColor),
              ),
              SizedBox(height: 30),
              Text(
                widget.hino?.letra ?? '',
                style: TextStyles.customAll(
                    color: defaultColor,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.w600,
                    height: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
