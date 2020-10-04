import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/reservation.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

//this is for view QR code and full details of the reservation

class Appoinment extends StatefulWidget {
  final Reservation _reservation;
  Appoinment(this._reservation);
  @override
  _AppoinmentState createState() => _AppoinmentState(this._reservation);
}

class _AppoinmentState extends State<Appoinment> {
  Reservation _reservation;
  Shop _shop; //getting though request
  Future<void> _launched;
  _AppoinmentState(this._reservation);

  @override
  void initState() {
    // TODO: implement initState
    getShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      // appBar: AppBar(
      //   title: const Text('DraggableScrollableSheet'),
      // ),

      body: Container(
        child: Center(
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Container(
                  child: QrImage(
                    data: makeEncript(_reservation.resID),
                    version: QrVersions.auto,
                    size: 300.0,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(10),
                  ),
                ))),
      ),

      floatingActionButton: RaisedButton(
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: Wrap(
          children: [
            Text("More Details",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> getShop() async {
    var result = await httpGet('shop', {
      "shopId": _reservation.salon_id,
    });

    var inShop = result.data as List<dynamic>;
    var inShopx = inShop[0];

    _shop = Shop.contact(
        inShopx[0]['salon_id'],
        inShopx[0]['shop_name'],
        inShopx[0]['salon_address'],
        inShopx[0]['district'],
        inShopx[0]['contact'],
        inShopx[0]['email'],
        inShopx[0]['about']);

    print(inShopx[0]['salon_id']);
    // print(_reservation.salon_id);
  }

  String makeEncript(int x) {
    print(x);
    int val = 99 * x;
    val = val + 60;
    print(val);
    return val.toString();
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: new Text(
                          "ReservationDetails",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: new Icon(Icons.home),
                      title: new Text(_shop.shopName),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(_shop.shopAddress),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(_shop.contact.toString()),
                      onTap: () => setState(() {
                        _launched =
                            _makePhoneCall('tel:${_shop.contact.toString()}');
                      }),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Rs.${_reservation.total}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(_reservation.date.substring(0, 10)),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text(_reservation.start_time),
                    ),
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text("${_reservation.duration} min"),
                    ),
                  ],
                ),
              ));
        });
  }

  //this is call the phone number
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
