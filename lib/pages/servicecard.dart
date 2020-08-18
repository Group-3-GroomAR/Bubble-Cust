import 'package:bubbletest/extra/service.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  Service _service;
  ServiceCard(this._service);
  @override
  _ServiceCardState createState() => _ServiceCardState(this._service);
}

class _ServiceCardState extends State<ServiceCard> {
  Service _service;
  _ServiceCardState(this._service);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          shadowColor: Colors.grey,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              title: Text(_service.serviceName),
              subtitle: Text(
                  "Duration:${_service.duration}\nPrice:${_service.price}"),
              trailing: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text("ADD")),
            ),
          )),
    );
  }
}
