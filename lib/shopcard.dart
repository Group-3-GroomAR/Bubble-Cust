//this card is to use in main screen

import 'package:flutter/material.dart';

class ShopCard extends StatefulWidget {
  final String _nam;
  final String _add;
  final String _dis;

  ShopCard(this._nam, this._add, this._dis);

  @override
  _ShopCardState createState() =>
      _ShopCardState(this._nam, this._add, this._dis);
}

class _ShopCardState extends State<ShopCard> {
  String _shopName = "Name";
  String _address = "Address";
  String _discription = "Discription";

  //this is constructor
  _ShopCardState(this._shopName, this._address, this._discription);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'https://www.48hourslogo.com/48hourslogo_data/2018/07/14/74963_1531515608.jpg',
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
                          _shopName,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(Icons.star, color: Colors.grey),
                        Icon(Icons.star, color: Colors.grey),
                        Text(
                          "4.5(413)",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _address,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _discription,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Divider(thickness: 1),
                    Row(
                      children: [
                        Text(
                          "Today's availability",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 3,
                      children: [
                        Chip(
                          label: Text("5:30PM"),
                          elevation: 5,
                        ),
                        Chip(
                          label: Text(
                            "7:30PM",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                          elevation: 5,
                          backgroundColor: Colors.purple.shade100,
                        ),
                        Chip(
                          label: Text("8:00PM"),
                          elevation: 5,
                        ),
                        Chip(
                          label: Text("9:00PM"),
                          elevation: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
