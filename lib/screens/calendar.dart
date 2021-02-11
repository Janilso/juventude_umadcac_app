import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/components/card_event.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/components/custom_calendar.dart';
import 'package:juventude_umadcac_app/components/menu.dart';
import 'package:juventude_umadcac_app/models/evento.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
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
      drawer: DrawerMenu(),
      appBar: CustomAppBar(
        title: 'AGENDA',
      ),
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
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomCalendar(
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
                      color: greyLight),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    _buildLend('Hoje', color: grey),
                    _buildLend('Dia Selecionado', color: green),
                    _buildLend('Evento', gradient: gradientApp),
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
    return Row(
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
            style: TextStyle(
                fontFamily: 'Baloo', fontSize: 20, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget _buildListEvents(ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradientApp,
        borderRadius: _borderRadius,
      ),
      height: 20,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Container(
                width: _sizeScreen.width * 0.3,
                height: 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
              ),
            ),
          ),
          // SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              controller: scrollController,
              separatorBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: Colors.white, thickness: 2),
              ),
              itemBuilder: (context, index) {
                Evento evento = _selectedEvents[index];
                return CardEvent(
                  title: evento.titulo,
                  hours: evento.horario,
                  congregation: evento.congregacao,
                  address: evento.endereco,
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
