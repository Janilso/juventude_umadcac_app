import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/card_empty.dart';
import 'package:juventude_umadcac_app/components/card_loading.dart';
import 'package:juventude_umadcac_app/components/card_repertoire.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/models/repertorio.dart';
import 'package:juventude_umadcac_app/screens/detail_hymn.dart';

final String letra = '''
Aviva-me!\n
Espírito de Deus!\n
Manifesta aqui\n
Glória e poder\n
(Glória e poder)\n
\n
Aviva-me!\n
Espírito de Deus!\n
Manifesta aqui\n
Glória e poder\n
(Glória e poder)\n
\n
Santo, tu és o primeiro\n
És tudo que eu tenho\n
Toma minha vida\n
Espírito Santo, tu és o primeiro\n
És tudo que tenho\n
Toma minha vida\n
(Glória e poder)\n
\n
Santo, tu és o primeiro
És tudo que eu tenho\n
Toma minha vida\n
Espírito Santo, tu és o primeiro\n
És tudo que tenho\n
Toma minha vida\n
(Glória e poder)\n
''';

final List<Hino> hinos = [
  Hino(nome: "Aviva-me!", autoria: "Jéssica Augusto", letra: letra),
  Hino(nome: "Sou mais", autoria: "Jéssica Augusto ", letra: letra),
  Hino(nome: "Medley", autoria: "Auto desconhecido", letra: letra),
  Hino(nome: "Todavia Me Alegrarei", autoria: "Leandro Soares", letra: letra),
  Hino(nome: "Algo Novo", autoria: "Kemuel", letra: letra),
  Hino(nome: "Aba", autoria: "Kemuel", letra: letra),
  Hino(nome: "Ousado Amor", autoria: "Isaias Saad", letra: letra),
  Hino(nome: "Fica Tranquilo", autoria: "Kemilly Santos", letra: letra),
];

class RepertoireScreen extends StatefulWidget {
  @override
  RepertoireScreenState createState() => RepertoireScreenState();
}

class RepertoireScreenState extends State<RepertoireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "REPERTÓRIO"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: getFutureList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool hasHinos = snapshot.data.length > 0;

                return hasHinos
                    ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        separatorBuilder: (_, __) => Container(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          Hino hino = snapshot.data[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: CardRepertoire(
                              title: hino.nome,
                              subtitle: hino.autoria,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => DetailHymnScreen(
                                              hino: hino,
                                            )));
                              },
                            ),
                          );
                        })
                    : CardEmpty(
                        mensage: "Repertório Vazio",
                      );
              } else {
                return CardLoading();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Hino>> getFutureList() async =>
      await Future.delayed(Duration(seconds: 3), () {
        return hinos;
        // return [];
      });
}
