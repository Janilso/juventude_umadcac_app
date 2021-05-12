import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/card_repertoire.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/models/repertorio.dart';

final List<Hino> hinos = [
  Hino(nome: "Aviva-me!", autoria: "Jéssica Augusto"),
  Hino(nome: "Sou mais", autoria: "Jéssica Augusto "),
  Hino(nome: "Medley", autoria: "Auto desconhecido"),
  Hino(nome: "Todavia Me Alegrarei", autoria: "Leandro Soares"),
  Hino(nome: "Algo Novo", autoria: "Kemuel"),
  Hino(nome: "Aba", autoria: "Kemuel"),
  Hino(nome: "Ousado Amor", autoria: "Isaias Saad"),
  Hino(nome: "Fica Tranquilo", autoria: "Kemilly Santos"),
];

class RepertoireScream extends StatefulWidget {
  @override
  RepertoireScreamState createState() => RepertoireScreamState();
}

class RepertoireScreamState extends State<RepertoireScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "REPERTÓRIO"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              separatorBuilder: (_, __) => Container(),
              itemCount: hinos.length,
              itemBuilder: (_, index) {
                Hino hino = hinos[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: CardRepertoire(
                    title: hino.nome,
                    subtitle: hino.autoria,
                    onTap: () {
                      print("tesdsad");
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
