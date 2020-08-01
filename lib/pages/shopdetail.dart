import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  ShopDetail({Key key}) : super(key: key);

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopdetails"),
      ),
    );
  }
}
