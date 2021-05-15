import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' show DateFormat;

class CustomCalendar extends StatefulWidget {
  final Map<DateTime, List<dynamic>> events;
  final Function(DateTime, List<dynamic>, List<dynamic>) onDaySelected;

  const CustomCalendar({Key key, @required this.events, this.onDaySelected})
      : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  TextStyle _configureStyle(
      {Color color, FontWeight fontWeight, double fontSize}) {
    return TextStyle().copyWith(
        fontFamily: "Baloo",
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 20,
        color: color ?? AppColors.defaultColor);
  }

  Widget _buildConfigureDays(BuildContext context, DateTime date,
      {double margin: 2,
      Color bg,
      Gradient bgGradient,
      Color fontColor,
      bool circular: false}) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(margin),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: circular ? BorderRadius.all(Radius.circular(100)) : null,
        gradient: bgGradient,
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(
          '${date.day}',
          style: _configureStyle(color: fontColor),
        ),
      ),
    );
  }

  Widget _buildConfigureWeekNames(context, name, {fontColor}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Text(
        '${name[0].toUpperCase()}${name.substring(1)}',
        style: _configureStyle(
            fontSize: 18, color: fontColor ?? AppColors.defaultColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      locale: 'pt_BR',
      availableGestures: AvailableGestures.horizontalSwipe,
      events: widget.events,
      weekendDays: [7],
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        eventDayStyle: _configureStyle(),
        outsideStyle: _configureStyle(color: Colors.black26),
        outsideWeekendStyle:
            _configureStyle(color: AppColors.primary.withAlpha(50)),
        weekdayStyle: _configureStyle(),
        weekendStyle: _configureStyle(color: AppColors.primary),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        titleTextStyle: _configureStyle(
            color: AppColors.blueLight,
            fontWeight: FontWeight.w600,
            fontSize: 24),
        titleTextBuilder: (date, locale) {
          String text = DateFormat('MMM y', locale).format(date);
          return "${text[0].toUpperCase()}${text.substring(1)}";
        },
        formatButtonVisible: false,
        rightChevronIcon:
            Icon(Feather.chevron_right, color: AppColors.blueLight, size: 25),
        rightChevronMargin: EdgeInsets.only(bottom: 15),
        leftChevronMargin: EdgeInsets.only(bottom: 15),
        leftChevronIcon:
            Icon(Feather.chevron_left, color: AppColors.blueLight, size: 25),
      ),
      onDaySelected: widget.onDaySelected,
      builders: CalendarBuilders(
        dayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());

          Gradient gradient = events.isEmpty
              ? null
              : isBeforeDate
                  ? AppColors.gradientAppDesabled
                  : AppColors.gradientApp;
          Color bgColor = events.isEmpty ? Colors.transparent : null;
          Color fontColor =
              events.isEmpty ? AppColors.defaultColor : Colors.white;

          return _buildConfigureDays(context, date,
              circular: events.isNotEmpty,
              bgGradient: gradient,
              bg: bgColor,
              fontColor: fontColor);
        },
        todayDayBuilder: (context, date, _) => _buildConfigureDays(
            context, date,
            circular: true, bg: AppColors.grey),
        selectedDayBuilder: (context, date, _) {
          return _buildConfigureDays(context, date,
              circular: true, bg: AppColors.green, fontColor: Colors.white);
        },
        weekendDayBuilder: (context, DateTime date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());

          Gradient gradient = events.isEmpty
              ? null
              : isBeforeDate
                  ? AppColors.gradientAppDesabled
                  : AppColors.gradientApp;
          Color bgColor = events.isEmpty ? Colors.transparent : null;
          Color fontColor = events.isEmpty ? AppColors.redLight : Colors.white;

          return _buildConfigureDays(context, date,
              circular: events.isNotEmpty,
              bg: bgColor,
              bgGradient: gradient,
              fontColor: fontColor);
        },
        outsideDayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());

          Gradient gradient = events.isEmpty
              ? null
              : isBeforeDate
                  ? AppColors.gradientAppDesabled
                  : AppColors.gradientApp;
          Color bgColor = events.isEmpty ? Colors.transparent : null;
          Color fontColor = events.isEmpty
              ? AppColors.defaultColor.withOpacity(0.3)
              : Colors.white;

          return _buildConfigureDays(context, date,
              circular: events.isNotEmpty,
              bgGradient: gradient,
              bg: bgColor,
              fontColor: fontColor);
        },
        outsideWeekendDayBuilder: (context, date, eventsList) {
          List events = eventsList ?? [];
          bool isBeforeDate = date.isBefore(DateTime.now());
          Gradient gradient = events.isEmpty
              ? null
              : isBeforeDate
                  ? AppColors.gradientAppDesabled
                  : AppColors.gradientApp;
          Color bgColor = events.isEmpty ? Colors.transparent : null;
          Color fontColor = events.isEmpty
              ? AppColors.redLight.withOpacity(0.3)
              : Colors.white;
          return _buildConfigureDays(context, date,
              circular: events.isNotEmpty,
              bgGradient: gradient,
              bg: bgColor,
              fontColor: fontColor);
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
          return _buildConfigureWeekNames(context, name);
        },
        dowWeekendBuilder: (context, name) {
          return _buildConfigureWeekNames(context, name,
              fontColor: AppColors.redLight);
        },
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.gradientAppInverted,
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
}
