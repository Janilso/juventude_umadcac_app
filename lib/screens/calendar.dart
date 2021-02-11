import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/components/card_event.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
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

  // void _onVisibleDaysChanged(
  //     DateTime first, DateTime last, CalendarFormat format) {
  //   print('CALLBACK: _onVisibleDaysChanged');
  // }

  // void _onCalendarCreated(
  //     DateTime first, DateTime last, CalendarFormat format) {
  //   print('CALLBACK: _onCalendarCreated');
  // }

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
              child: _buildTableCalendar(context),
              // child: _buildCalendar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      weekendDays: [7],
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        eventDayStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: defaultColor),
        outsideStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black26),
        outsideWeekendStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: primaryColor.withAlpha(50)),
        weekdayStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: defaultColor),
        weekendStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: primaryColor),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        titleTextStyle: TextStyle().copyWith(
            fontFamily: "Baloo",
            fontWeight: FontWeight.w700,
            color: blueLight,
            fontSize: 28),
        titleTextBuilder: (date, locale) {
          String text = DateFormat('MMM y', locale).format(date);
          return "${text[0].toUpperCase()}${text.substring(1)}";
        },
        formatButtonVisible: false,
        rightChevronIcon:
            Icon(Feather.chevron_right, color: blueLight, size: 30),
        rightChevronMargin: EdgeInsets.only(bottom: 15),
        leftChevronMargin: EdgeInsets.only(bottom: 15),
        leftChevronIcon: Icon(Feather.chevron_left, color: blueLight, size: 30),
      ),
      onDaySelected: _onDaySelected,
      locale: 'pt_BR',
      builders: CalendarBuilders(
        dayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());

          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(events.isEmpty ? 0 : 100)),
              gradient: events.isEmpty
                  ? null
                  : isBeforeDate
                      ? gradientAppDesabled
                      : gradientApp,
              color: events.isEmpty ? Colors.transparent : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                    fontFamily: "Baloo",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: events.isEmpty ? defaultColor : Colors.white),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                    fontFamily: "Baloo",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: defaultColor),
              ),
            ),
          );
        },
        selectedDayBuilder: (context, date, _) {
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: green,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                    fontFamily: "Baloo",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          );
        },
        weekendDayBuilder: (context, DateTime date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());

          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: events.isEmpty
                  ? null
                  : isBeforeDate
                      ? gradientAppDesabled
                      : gradientApp,
              borderRadius: events.isEmpty
                  ? null
                  : BorderRadius.all(Radius.circular(100)),
              color: events.isEmpty ? Colors.transparent : Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                    fontFamily: "Baloo",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: events.isEmpty ? primaryColor : Colors.white),
              ),
            ),
          );
        },
        outsideDayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(events.isEmpty ? 0 : 100)),
              gradient: events.isEmpty
                  ? null
                  : isBeforeDate
                      ? gradientAppDesabled
                      : gradientApp,
              color: events.isEmpty ? Colors.transparent : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                  fontFamily: "Baloo",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: events.isEmpty
                      ? defaultColor.withOpacity(0.3)
                      : Colors.white,
                ),
              ),
            ),
          );
        },
        outsideWeekendDayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(events.isEmpty ? 0 : 100)),
              gradient: events.isEmpty
                  ? null
                  : isBeforeDate
                      ? gradientAppDesabled
                      : gradientApp,
              color: events.isEmpty ? Colors.transparent : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                  fontFamily: "Baloo",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: events.isEmpty
                      ? primaryColor.withOpacity(0.3)
                      : Colors.white,
                ),
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }
          return children;
        },
        dowWeekdayBuilder: (context, name) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Text(
              '${name[0].toUpperCase()}${name.substring(1)}',
              style: TextStyle().copyWith(
                fontFamily: "Baloo",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: defaultColor,
              ),
            ),
          );
        },
        dowWeekendBuilder: (context, name) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Text(
              '${name[0].toUpperCase()}${name.substring(1)}',
              style: TextStyle().copyWith(
                fontFamily: "Baloo",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradientAppInverted,
          border: Border.all(color: Colors.white, width: 2)),
      width: 18.0,
      height: 18.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(color: Colors.white, fontSize: 12),
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
                        child: CustomScrollBar(
                          scrollController: scrollController,
                          color: Colors.white,
                          builder: (context, _) {
                            return ListView.separated(
                              controller: scrollController,
                              separatorBuilder: (context, index) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
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
                            );
                          },

                          // child: ,
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
