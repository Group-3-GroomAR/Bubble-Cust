import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  String _result = "Nothing";
  List<Shop> shopList = [];

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
            getShop();
            // var result = httpGet("tom");
            // httpGet("shop").then((value) => _result = value.data.toString());
            // setState(() {
            //   print(_result);
            // });
          },
          child: Icon(Icons.network_wifi)),
    );
  }

  //this is to get shop details
  Future<void> getShop() async {
    var result = await httpGet('shop');
    if (result.ok) {
      setState(() {
        shopList.clear();
        var in_shop = result.data as List<dynamic>;
        in_shop.forEach((in_shop) {
          shopList.add(Shop(in_shop['salon_id'], in_shop['shop_name'],
              in_shop['salon_address'], in_shop['district']));
        });
        print(shopList.length.toString());
        print(shopList[0].shopName);
        print(shopList[1].shopName);
        print(shopList[2].shopName);
      });
    }
  }
}
