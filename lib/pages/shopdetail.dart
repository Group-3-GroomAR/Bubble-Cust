import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:bubbletest/extra/time.dart';
import 'package:bubbletest/pages/weeklisttile.dart';
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
  List<DateTime> dateList = new List(7); //to add DateTime object
  _ShopDetailState(this._shop);
  Future<void> _launched;
  List<Widget> _widgetList;

  @override
  void initState() {
    _tel = _shop.contact.toString();
    dateList = createDateTimeList();
    getAvailableTime();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "${_shop.shopName}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
            // Wrap(
            //   children: [Text(dateList.toString())],
            // ),
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
              subtitle: Text(_shop.about),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
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

            _widgetList != null
                ? ExpansionTile(
                    maintainState: true,
                    title: Text(
                      "Available Dates",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    children: _widgetList,
                  )
                : Text(
                    "Available Dates Not Available",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() {
      //     _launched = _makePhoneCall('tel:$_tel');
      //   }),
      //   child: Icon(Icons.call),
      // ),
    );
  }

  // DateTime getCurrentWeek() {
  //   var currentDate = new DateTime.now();
  //   return currentDate;
  // }

  //this is creating upcoming 7 days
  List<DateTime> createDateTimeList() {
    List<DateTime> dateList = List(7);
    var currentDate = new DateTime.now();
    int i;

    for (i = 0; i < 7; i++) {
      dateList[i] = currentDate.add(Duration(days: i));
    }
    print(dateList.toString());
    return dateList;
  }

  //this is useto create ui
  List<Widget> createTitle(List<DateTime> date, List<Time> time) {
    print("Length of time${time.length}");
    List<WeekListTile> tile = List(7);
    int i;

    for (i = 0; i < date.length; i++) {
      tile[i] = WeekListTile(date[i], _shop, findTime(date[i].weekday, time));
      //print("Done");
    }
    return tile;
  }

  //this is to find the correct time object for a til
  Time findTime(int i, List<Time> time) {
    Time obj;
    int j;
    for (j = 0; j < time.length; j++) {
      if (time[j].day == i) {
        obj = time[j];
      }
    }
    return obj;
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getAvailableTime() async {
    List<Time> timeList = []; //list to add shop objects
    var result = await httpGet('opentime', {"shopId": _shop.shopID});
    if (result.ok) {
      print("Open time details recived to Main");
      setState(() {
        timeList.clear();
        var inShop = result.data as List<dynamic>;
        inShop.forEach((inShop) {
          timeList.add(Time(
            inShop['salon_id'],
            inShop['day'],
            inShop['open_time'],
            inShop['close_time'],
            inShop['is_open'],
          ));
          //print(inShop['is_open'].toString());
        });
        //print("Length${timeList.length.toString()}");
        //createUI();
        _widgetList = createTitle(dateList, timeList);
      });
    } else if (!result.ok) {
      // final snackBar = SnackBar(content: Text('Connection Error'));
      // Scaffold.of(context).showSnackBar(snackBar);
      timeList.clear();
      setState(() {});
      print("Unable to get data to Main");
    }
  }
}
