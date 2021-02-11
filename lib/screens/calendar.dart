import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/components/card_event.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/components/custom_calendar.dart';
import 'package:juventude_umadcac_app/components/custom_scroll_bar.dart';
import 'package:juventude_umadcac_app/components/menu.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:juventude_umadcac_app/models/evento.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
// Table Calendar
  // AnimationController _animationController;
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;

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
    if (events.isNotEmpty) _configurandoModalBottomSheet(context, events);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: CustomAppBar(
        title: 'AGENDA',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomCalendar(
                events: _events,
                onDaySelected: _onDaySelected,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _configurandoModalBottomSheet(BuildContext context, List events) {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black26,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 1,
              minChildSize: 0.25,
              builder: (context, scrollController) {
                return Container(
                  decoration: new BoxDecoration(
                      // color: Colors.white,
                      gradient: gradientApp,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20))),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: Colors.white, thickness: 2),
                          ),
                          itemBuilder: (context, index) {
                            Evento evento = events[index];
                            return CardEvent(
                              title: evento.titulo,
                              hours: evento.horario,
                              congregation: evento.congregacao,
                              address: evento.endereco,
                            );
                          },
                          itemCount: events.length,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              });
        });
  }
}
