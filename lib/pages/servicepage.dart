import 'dart:developer';
import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/extra/service.dart';
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

  List<Service> serviceList = [];
  double _total = 0;

  @override
  void initState() {
    getService();
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
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: serviceList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // padding: const EdgeInsets.all(5),
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(serviceList[index].serviceName),
                          subtitle: Text(
                              "Duration:${serviceList[index].duration}\nPrice:${serviceList[index].price}"),
                          trailing: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                print(index);
                                setState(() {
                                  bool temp = serviceList[index].isAdd;
                                  serviceList[index].isAdd = !temp;
                                  _total = getTotal(); 
                                });
                              },
                              color: serviceList[index].isAdd
                                  ? Colors.grey.shade200
                                  : Colors.blue,
                              child: Text(
                                serviceList[index].isAdd ? "Remove" : "Add",
                                style: TextStyle(
                                  color: serviceList[index].isAdd
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )),
                        ),
                      )),
                );
              })),
      floatingActionButton: RaisedButton(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {},
        child: Wrap(
          children: [
            Text("Total:\t ${_total}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //calculate total and return
  double getTotal() {
    double total = 0;
    int i;

    for (i = 0; i < serviceList.length; i++) {
      if (serviceList[i].isAdd == true) {
        total = total + serviceList[i].price;
      }
    }
    return total;
  }

  //getting service details from
  Future<void> getService() async {
    var result = await httpGet('servicelist', {
      "shopId": _shop.shopID,
    });
    if (result.ok) {
      print("shop details recived");
      setState(() {
        if (serviceList != null) {
          serviceList.clear();
        }
        var inService = result.data as List<dynamic>;
        inService.forEach((inService) {
          serviceList.add(Service(
              inService['service_id'],
              inService['salon_id'],
              inService['is_male'],
              inService['is_female'],
              inService['is_childrn'],
              inService['service_name'],
              double.parse(inService['price']),
              inService['duration'],
              inService['service_category']));
        });
        print("Service list length${serviceList.length}");

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
