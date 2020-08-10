import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopDetail extends StatefulWidget {
  final Shop _obj;
  ShopDetail(this._obj);

  @override
  _ShopDetailState createState() => _ShopDetailState(this._obj);
}

class _ShopDetailState extends State<ShopDetail> {
  Shop _shop;
  String _tel;
  _ShopDetailState(this._shop);
  Future<void> _launched;

  @override
  void initState() {
    _tel = _shop.contact.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop details"),
      ),
//      body:SingleChildScrollView(
//              child: Container(
//              padding: EdgeInsets.symmetric(horizontal: 24),
//              child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//              Wrap(
//              children: <Widget>[
////              Image.asset("assets/images/scissors.jpg", height: 220),
//              SizedBox(
//              width: 20,
//              ),
//              Container(
//              width: MediaQuery.of(context).size.width - 222,
//              height: 220,
//              child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//            Text(
//            "Dr. Stefeni Albert",
//            style: TextStyle(fontSize: 32),
//            ),
//            Text(
//            "Heart Speailist",
//            style: TextStyle(fontSize: 19, color: Colors.grey),
//            ),
//            SizedBox(
//            height: 40,
//            ),
//            Row(
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.call),
//              ),
//              IconButton(
//                icon: Icon(Icons.email),
//              ),
//
//              IconButton(
//                icon: Icon(Icons.video_call),
//              )
////            IconTile(
////            backColor: Color(0xffFFECDD),
////            imgAssetPath: "assets/email.png",
////            ),
////            IconTile(
////            backColor: Color(0xffFEF2F0),
////            imgAssetPath: "assets/call.png",
////            ),
////            IconTile(
////            backColor: Color(0xffEBECEF),
////            imgAssetPath: "assets/video_call.png",
//
//            ],
//            )
//            ],
//            ),
//            ),
//            ],
//            ),
////                Center(
////                  child: Text(_shop.contact.toString()),
////                ),
//              ])
//        ,
//      ),
//      ),
      
      
      body:ListView(
        padding: new EdgeInsets.all(5.0),
        children: [
          Wrap(
            spacing: 10,
            children: [
              Image.network('https://picsum.photos/250?image=9',
                fit: BoxFit.fitHeight,
                width: 100,
                height: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${_shop.shopName}",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                  Text("District:${_shop.district}",
                    style: TextStyle(fontSize: 15)),

                  Wrap(
                    children: [
                      IconButton(
                          icon: Icon(Icons.call),
                        ),
                        IconButton(
                          icon: Icon(Icons.email),
                        ),

                        IconButton(
                          icon: Icon(Icons.video_call),
                        )

                    ],
                  )




                ],
              )
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _launched = _makePhoneCall('tel:$_tel');
        }),
        child: Icon(Icons.call),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
