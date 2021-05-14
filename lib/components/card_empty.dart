import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class CardEmpty extends StatelessWidget {
  final String mensage;
  final double heightFactor;

  const CardEmpty({Key key, this.mensage = "Vazio", this.heightFactor = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: heightFactor,
      child: Column(
        children: [
          SvgPicture.asset(ImagesAssets.svgEmpty),
          SizedBox(height: 15),
          Text(mensage, style: TextStyles.h4Regular(color: primaryColor))
        ],
      ),
    );
  }
}
