import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/widgets/card_job_titles_widget.dart';
import 'package:juventude_umadcac_app/widgets/app_bar_widget.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "SOBRE"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(child: Image.asset(ImagesAssets.logoVC)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.textReading(
                        color: AppColors.defaultColor),
                    children: [
                      TextSpan(
                          text:
                              'A Umadcac é a União da Mocidade da Assembléia de Deus em Cidade Ademar e congregações, membro da UMADEB-SP na Regional ABCD representada por centenas de jovens e liderança atuante em diversos bairros de São Paulo.')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sua diretoria é composta por:',
                style: AppTextStyles.h4SemiBold(color: AppColors.defaultColor),
              ),
              _buildListJobTitles(),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                    text: TextSpan(
                        style: AppTextStyles.textReading(
                            color: AppColors.defaultColor),
                        children: [
                      TextSpan(
                          text:
                              'A nossa missão é cumprir o IDE de Cristo, conduzindo a nossa juventude por um alicerce seguro baseado em propósitos que mantenha a chama do avivamento acesa, avançando para a aalvação que nos é garantida por meio da santificação! Ore, divulgue e participe!')
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListJobTitles() {
    return Center(
      child: Container(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          childAspectRatio: 0.8,
          padding: EdgeInsets.only(top: 20),
          children: [
            CardJobTitlesWidget(
                jobTitle: "Pr. Presidente",
                name: "José Wellington Bezerra da Costa"),
            CardJobTitlesWidget(
                jobTitle: "Pr. Setorial", name: "João Barbosa da Silva"),
            CardJobTitlesWidget(
                jobTitle: "Coordenação Geral",
                name: "Pr. Lélis Washington Marinhos"),
            CardJobTitlesWidget(
                jobTitle: "Coordenação Regional ABCD",
                name: "Pr. Deoclécio Martins"),
            CardJobTitlesWidget(
                jobTitle: "Sub Coordenação Regional",
                name: "Pr. Marcelo Ferreira"),
            CardJobTitlesWidget(
                jobTitle: "Coordenação Setorial",
                name: "Dc. Jefferson de Oliveira e Pr. Waldir Ferreira"),
          ],
        ),
      ),
    );
  }
}
