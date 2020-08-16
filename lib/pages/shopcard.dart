//this card is to use in main screen
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/pages/shopdetail.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatefulWidget {
  final Shop obj;
  ShopCard(this.obj);

  @override
  _ShopCardState createState() => _ShopCardState(this.obj);
}

class _ShopCardState extends State<ShopCard> {
  Shop _shop;
  _ShopCardState(this._shop);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new ShopDetail(_shop)));
      },
      child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.grey,
          child: Column(
            children: [
              Card(
                elevation: 6,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    _shop.image,
                    fit: BoxFit.cover,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          _shop.shopName,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _shop.shopAddress,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _shop.district,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10))
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
