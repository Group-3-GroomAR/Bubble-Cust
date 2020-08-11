import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'moredetails.dart';


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
        title: Text("Notification Panel"),
      ),
      body: Center(
          child:ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: (Color(0xFF674ea7)),
                    width: 3,
                  ),
                ),

                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(2),
                      height: 70,
                      width: 70,
                      decoration:BoxDecoration(
                          image: DecorationImage(

                              image: AssetImage('assets/images/salonprofile.jpg')
                          ),
                          shape: BoxShape.circle,
                          border:Border.all(
                              color: Colors.black,
                              width: 2
                          )


                      ) ,
                    ),

                    Padding(
                      padding:EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width:180.0,
                                child: Text(
                                  //salon.name
                                  'Beauty Salons',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color:(Color(0xFF674ea7)),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            //activity.name
                            "Hair Cutting",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 100.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color:(Color(0xFF674ea7)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  //date
                                  "08/08/2020",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color:(Color(0xFF674ea7)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  //time
                                  "9.00 AM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              )

                            ],
                          ),

                          RaisedButton(
                            child: Text("More Details -->"),
                            onPressed:(){
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) => new NotificationDetails()));
                            },
                            color: Colors.black,
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            splashColor: Colors.grey,

                          ),


                        ],
                      ),
                    ),
                  ],
                ),

              ),






            ],

          )
        //child: Text(_result),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("reqest begin");
            getShop();
            // var result = httpGet("tom");
            // httpGet("shop").then((value) => _result = value.data.toString());
            // setState(() {
            //   print(_result);
            // });
          },
          child: Icon(Icons.network_wifi)),*/
    );
  }

  //this is to get shop details
  Future<void> getShop() async {
    var result = await httpGet('shop');
    if (result.ok) {
      //this is checking true or not
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
