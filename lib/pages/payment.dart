import 'dart:ui';

import 'package:bubbletest/extra/service.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class Payment extends StatefulWidget {
  final Shop obj;
  final DateTime date;
  final List<Service> serviceList;

  Payment(this.obj, this.date, this.serviceList);

  @override
  _PaymentState createState() =>
      _PaymentState(this.obj, this.date, this.serviceList);
}

class _PaymentState extends State<Payment> {
  Shop _shop;
  DateTime _dateTime;
  List<Service> _serviceList;
  String _service;
  String _price;
  String _note;

  _PaymentState(this._shop, this._dateTime, this._serviceList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Reservation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.deepPurple,
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  "Available Time:",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                trailing: Text(
                  "10.20 AM",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.timer),
                title: Text("Duration"),
                trailing: Text(
                  "${getDuration()} min",
                  style: TextStyle(color: Colors.blue),
                ),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Date"),
                trailing: Text(
                  "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                  style: TextStyle(color: Colors.blue),
                ),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.store_mall_directory),
                title: Text("${_shop.shopName}"),
                subtitle: Text("${_shop.shopAddress}"),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                  title: Text("Note"),
                  subtitle: Container(
                    padding: EdgeInsets.only(bottom: 7),
                    child: TextField(
                      onChanged: (value) {
                        _note = value;
                        print(_note);
                      },
                    ),
                  ))),
          Card(
              margin: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      "Service Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            getService(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          new Text(getPrice(),
                              style: TextStyle(
                                fontSize: 16,
                              ))
                        ]),
                    Divider(
                      color: Colors.black,
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          new Text("Rs.${getTotal().toString()}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ]),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: RaisedButton(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {},
        child: Wrap(
          children: [
            Text("Book Now",
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

  //calculate total price and return
  double getTotal() {
    double total = 0;
    int i;
    for (i = 0; i < _serviceList.length; i++) {
      if (_serviceList[i].isAdd == true) {
        total = total + _serviceList[i].price;
      }
    }
    return total;
  }

  //calculate total and return
  int getDuration() {
    int total = 0;
    int i;
    for (i = 0; i < _serviceList.length; i++) {
      if (_serviceList[i].isAdd == true) {
        total = total + _serviceList[i].duration;
      }
    }
    return total;
  }

  //get service name for service details
  String getService() {
    String name = "\nService\n \n";
    int i;
    int count = 0;

    for (i = 0; i < _serviceList.length; i++) {
      if (_serviceList[i].isAdd == true) {
        count = count + 1;
        name = name + "${count}. " + _serviceList[i].serviceName + "\n";
      }
    }

    return name;
  }

  //this is price list
  String getPrice() {
    String price = "\nPrice\n \n";
    int i;

    for (i = 0; i < _serviceList.length; i++) {
      if (_serviceList[i].isAdd == true) {
        price = price + _serviceList[i].price.toString() + "\n";
      }
    }
    return price;
  }

  void payhere() {
    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1215551", // Replace your Merchant ID
      "merchant_secret":
          "4Dzf8ohdPcH8X138aXOkHy4JHKuX6h89j4Ob7OK8LoIx", // See step 4e
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "amount": "50.00",
      "currency": "LKR",
      "first_name": "Saman",
      "last_name": "Perera",
      "email": "abc@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(paymentObject, (paymentId) {
      print("One Time Payment Success. Payment Id: $paymentId");
    }, (error) {
      print("One Time Payment Failed. Error: $error");
    }, () {
      print("One Time Payment Dismissed");
    });
  }
}
