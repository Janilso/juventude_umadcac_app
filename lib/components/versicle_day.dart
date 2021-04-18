import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class VersicleDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(ImagesAssets.imageVersicle),
                  fit: BoxFit.contain,
                  alignment: FractionalOffset.topCenter,
                ),
                boxShadow: [
                  BoxShadow(color: shadowBlack, blurRadius: 20, spreadRadius: 0)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 20),
                  child: Text(
                    "VERSÍCULO DO DIA",
                    style: TextStyles.h2Bold(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        '"Escrevei, pois, aos judeus, como parecer bem aos vossos olhos, em nome do rei, e selai-o com o anel do rei; porque o documento que se escreve em nome do rei, e que se sela com o anel do rei, não se pode revogar."',
                        style: TextStyles.h4SemiBold(color: defaultColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    subtitle: Text(
                      "Romanos, 12.5",
                      style: TextStyles.h5Regular(color: defaultColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
