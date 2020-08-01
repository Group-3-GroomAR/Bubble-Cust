import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  final Shop _obj;
  ShopDetail(this._obj);

  @override
  _ShopDetailState createState() => _ShopDetailState(this._obj);
}

class _ShopDetailState extends State<ShopDetail> {
  Shop _shop;
  _ShopDetailState(this._shop);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop details"),
      ),
      body: Center(
        child: Text(_shop.shopID + ":::" + _shop.shopName),
      ),
    );
  }
}
