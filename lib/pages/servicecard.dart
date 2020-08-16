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
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.grey,
        child: ListTile(
          title: Text("Hair Cut"),
          subtitle: Text("Hair"),
          trailing: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {},
              color: Colors.blue,
              child: Text("ADD")),
        ),
      ),
    );
  }
}
