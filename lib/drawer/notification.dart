import 'package:bubbletest/backend/http.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  String _result = "Nothing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Center(
        child: Text(_result),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("reqest begin");
            // var result = httpGet("tom");
            httpGet("shop").then((value) => _result = value.data.toString());
            setState(() {
              print(_result);
            });
          },
          child: Icon(Icons.network_wifi)),
    );
  }
}
