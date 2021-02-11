import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart' show DateFormat;

class CardEvent extends StatelessWidget {
  final String title;
  final DateTime hours;
  final String congregation;
  final String address;

  const CardEvent({
    Key key,
    this.title,
    this.hours,
    this.congregation,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _hours = DateFormat.Hm("pt_BR").format(hours);
    Color _color = Colors.white;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: _color,
            fontFamily: "Baloo",
            fontWeight: FontWeight.w700,
            fontSize: 25,
            height: 1),
      ),
      subtitle: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Feather.clock, color: _color, size: 13),
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  _hours,
                  style: TextStyle(
                      color: _color,
                      fontFamily: "Baloo",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1),
                ),
              ),
              SizedBox(width: 25),
              Icon(Feather.home, color: _color, size: 13),
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  congregation.toUpperCase(),
                  style: TextStyle(
                      color: _color,
                      fontFamily: "Baloo",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Feather.map_pin, color: _color, size: 13),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    address,
                    style: TextStyle(
                        color: _color,
                        fontFamily: "Baloo",
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 1),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
