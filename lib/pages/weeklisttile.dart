import 'package:bubbletest/extra/date.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/pages/service.dart';
import 'package:flutter/material.dart';

class WeekListTile extends StatelessWidget {
  final DateTime _date;
  final Shop _shop;

  WeekListTile(this._date, this._shop); //constructor
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            DateTime.now().weekday == _date.weekday
                ? "${getWeekName(_date.weekday)}(today)"
                : getWeekName(_date.weekday),
            style: TextStyle(
                color: DateTime.now().weekday == _date.weekday
                    ? Colors.blue
                    : Colors.black),
          ),
          new Text(
            "9:00AM-10:00PM",
            style: TextStyle(
                color: DateTime.now().weekday == _date.weekday
                    ? Colors.blue
                    : Colors.black),
          ),
        ],
      ),
      subtitle: Text(
        "${_date.day}/${_date.month}/${_date.year}",
        style: TextStyle(
            color: DateTime.now().weekday == _date.weekday
                ? Colors.blue
                : Colors.grey),
      ),
      onTap: () => {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new ServicePage(_shop, _date)))
      },
    );
  }
}
