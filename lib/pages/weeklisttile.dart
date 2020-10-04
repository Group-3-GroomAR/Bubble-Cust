import 'package:bubbletest/extra/date.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/extra/time.dart';
import 'package:bubbletest/pages/servicepage.dart';
import 'package:flutter/material.dart';

class WeekListTile extends StatelessWidget {
  final DateTime _date;
  final Shop _shop;
  final Time _time;

  WeekListTile(this._date, this._shop, this._time); //constructor
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _time.isOpen == 1
          ? Icon(
              Icons.verified_user,
              color: Colors.green,
            )
          : Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
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
            _time.isOpen == 1
                ? "${_time.openTime.substring(0, 5)} - ${_time.closeTime.substring(0, 5)}"
                : "Not Available",
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
      enabled: _time.isOpen == 1 ? true : false,
      onTap: () => {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new ServicePage(_shop, _date)))
      },
    );
  }
}
