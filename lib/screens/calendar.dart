import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/widgets/card_event_widget.dart';
import 'package:juventude_umadcac_app/widgets/app_bar_widget.dart';
import 'package:juventude_umadcac_app/widgets/calendar_widget.dart';
import 'package:juventude_umadcac_app/models/evento.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;
  Size _sizeScreen;

  BorderRadiusGeometry _borderRadius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  void initState() {
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 11)): [
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
      ],
      _selectedDay.add(Duration(days: 1)): [
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
        Evento(
            titulo: 'Ensaio Setorial Umadcac',
            horario: DateTime.now(),
            congregacao: 'Sede - setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
      ],
      _selectedDay.add(Duration(days: 3)): Set.from([
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
        Evento(
            titulo: 'Ensaio Setorial Umadcac',
            horario: DateTime.now(),
            congregacao: 'Sede - setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
        Evento(
            titulo: 'Culto da Família',
            horario: DateTime.now(),
            congregacao: 'SEDE - Setor 8',
            endereco: 'Rua Tianguá, 25 - Vila Mascote - SP'),
      ]).toList(),
      _selectedDay.add(Duration(days: 18)): [
        Evento(
            titulo: 'Culto transformado pelo poder de Deus!',
            horario: DateTime.now(),
            congregacao: 'CONG. ADEMAR 1',
            endereco: 'Rua Carlo Formes, 10 - Americanópolis - Ademar - SP'),
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    setState(() {
      _selectedEvents = events;
    });
    // if (events.isNotEmpty) _configurandoModalBottomSheet(context, events);
  }

  @override
  Widget build(BuildContext context) {
    _sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(title: 'AGENDA'),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: .5,
        backdropEnabled: true,
        backdropTapClosesPanel: true,
        backdropOpacity: 0,
        renderPanelSheet: false,
        maxHeight: _selectedEvents.length == 1
            ? 170
            : _selectedEvents.length == 2
                ? 270
                : _sizeScreen.height * 0.6,
        borderRadius: _borderRadius,
        panelBuilder: (sc) =>
            _selectedEvents.isNotEmpty ? _buildListEvents(sc) : null,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarWidget(
                    events: _events, onDaySelected: _onDaySelected),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: _sizeScreen.width * 0.5,
                  height: 3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.greyLight),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    _buildLend('Hoje', color: AppColors.grey),
                    _buildLend('Dia Selecionado', color: AppColors.green),
                    _buildLend('Evento', gradient: AppColors.gradientApp),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLend(String description, {Color color, Gradient gradient}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: color, shape: BoxShape.circle, gradient: gradient),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              description,
              style: AppTextStyles.h5Medium(color: AppColors.defaultColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListEvents(ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.gradientApp,
        borderRadius: _borderRadius,
      ),
      height: 20,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                width: _sizeScreen.width * 0.35,
                height: 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              separatorBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: Colors.white, thickness: 1),
              ),
              itemBuilder: (context, index) {
                Evento evento = _selectedEvents[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CardEventWidget(
                    title: evento.titulo,
                    hours: evento.horario,
                    congregation: evento.congregacao,
                    address: evento.endereco,
                  ),
                );
              },
              itemCount: _selectedEvents.length,
            ),
          ),
        ],
      ),
    );
  }
}
