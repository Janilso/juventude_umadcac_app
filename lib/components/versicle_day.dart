import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

class VersicleDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(color: shadowBlack, blurRadius: 20, spreadRadius: 0)
                ]),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "VERSÍCULO DO DIA",
                  style: TextStyle(
                      fontFamily: "Baloo",
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    title: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        '"Não te deixes vencer pelo mal, mas vence o mal com o bem."',
                        style: TextStyle(
                            color: defaultColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    subtitle: Text(
                      "Romanos, 12.5",
                      style: TextStyle(
                          color: defaultColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
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
