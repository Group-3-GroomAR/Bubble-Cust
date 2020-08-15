import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/pages/weeklisttile.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final Shop _obj;
  final DateTime _date;
  ServicePage(this._obj, this._date);
  @override
  _ServicePageState createState() => _ServicePageState(this._obj, this._date);
}

class _ServicePageState extends State<ServicePage> {
  Shop _shop;
  DateTime _date;
  _ServicePageState(this._shop, this._date);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Service",
          ),
        ),
        body: Container(
            child: ListView(
          children: [
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
            WeekListTile(_date, _shop),
          ],
        )));
  }
}
