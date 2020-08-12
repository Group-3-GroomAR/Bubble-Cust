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
      body: Container(
        child: ListView(
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
            ListTile(
              title: Text(
                _shop.shopName,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text("About"),
              subtitle: Text(
                  "Men and Women saloon and spa with high safety messure.Permition got from Sri Lanka Health Ministry"),
            ),
            ListTile(
              leading: Icon(Icons.location_searching),
              title: Text(_shop.shopAddress),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(_shop.contact.toString()),
              onTap: () => setState(() {
                _launched = _makePhoneCall('tel:$_tel');
              }),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text(_shop.district),
            ),
          ],
        ),
      ),

      // body: ListView(
      //   padding: new EdgeInsets.all(5.0),
      //   children: [
      //     Wrap(
      //       spacing: 10,
      //       children: [
      //         Image.network(
      //           'https://picsum.photos/250?image=9',
      //           fit: BoxFit.fitHeight,
      //           width: 100,
      //           height: 200,
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               "${_shop.shopName}",
      //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //             ),
      //             Text("District:${_shop.district}",
      //                 style: TextStyle(fontSize: 15)),
      //             Wrap(
      //               children: [
      //                 IconButton(
      //                   icon: Icon(Icons.call),
      //                 ),
      //                 IconButton(
      //                   icon: Icon(Icons.email),
      //                 ),
      //                 IconButton(
      //                   icon: Icon(Icons.video_call),
      //                 )
      //               ],
      //             )
      //           ],
      //         )
      //       ],
      //     )
      //   ],
      // ),

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
