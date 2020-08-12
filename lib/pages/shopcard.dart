//this card is to use in main screen
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/pages/shopdetail.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatefulWidget {
  // final String _id;
  // final String _nam;
  // final String _add;
  // final String _dis;
  // ShopCard(this._id, this._nam, this._add, this._dis);
  final Shop obj;
  ShopCard(this.obj);

  @override
  _ShopCardState createState() =>
      //_ShopCardState(this._id, this._nam, this._add, this._dis);
      _ShopCardState(this.obj);
}

class _ShopCardState extends State<ShopCard> {
  // String _shopName = "Name";
  // String _address = "Address";
  // String _discription = "Discription";
  // String _id = "ID";
  // _ShopCardState(this._id, this._shopName, this._address, this._discription);
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
                    // Divider(thickness: 1),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Today's availability",
                    //       style: TextStyle(color: Colors.black, fontSize: 20),
                    //     )
                    //   ],
                    // ),
                    // Wrap(
                    //   spacing: 3,
                    //   children: [
                    //     Chip(
                    //       label: Text("5:30PM"),
                    //       elevation: 5,
                    //     ),
                    //     Chip(
                    //       label: Text(
                    //         "7:30PM",
                    //         style: TextStyle(color: Colors.deepPurple),
                    //       ),
                    //       elevation: 5,
                    //       backgroundColor: Colors.purple.shade100,
                    //     ),
                    //     Chip(
                    //       label: Text("8:00PM"),
                    //       elevation: 5,
                    //     ),
                    //     Chip(
                    //       label: Text("9:00PM"),
                    //       elevation: 5,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
