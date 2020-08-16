import 'dart:developer';

import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/extra/service.dart';
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

  List<Service> serviceList;

  @override
  void initState() {
    getService();
    // TODO: implement initState
    super.initState();
  }

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

  Future<void> getService() async {
    var result = await httpGet('servicelist', {
      "shopId": _shop.shopID,
    });
    if (result.ok) {
      print("shop details recived");
      setState(() {
        serviceList.clear();
        var inService = result.data as List<dynamic>;
        inService.forEach((inService) {
          serviceList.add(Service(
              inService['service_id'],
              inService['salon_id'],
              inService['is_male'],
              inService['is_female'],
              inService['is_childrn'],
              inService['service_name'],
              inService['price'],
              inService['duration'],
              inService['service_category']));
        });
        print(serviceList.length);

        //createUI();
      });
    } else if (!result.ok) {
      if (serviceList != null) {
        serviceList.clear();
      }
      setState(() {});
      print("Unable to get data");
    }
  }
}
