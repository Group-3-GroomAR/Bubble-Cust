import 'package:bubbletest/drawer/contactus.dart';
import 'package:bubbletest/drawer/history.dart';
import 'package:bubbletest/drawer/notification.dart';
import 'package:bubbletest/drawer/profile.dart';
import 'package:bubbletest/drawer/upcoming.dart';
import 'package:bubbletest/pages/shopcard.dart';
import 'package:flutter/material.dart';
import 'backend/http.dart';
import 'drawer/payment.dart';
import 'extra/shop.dart';

//import 'drawer/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        buttonColor: Colors.deepPurple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Shop> shopList = []; //list to add shop objects
  List<ShopCard> shopCardList = []; //this is list of
  int j;

  int _index = 0;
  int _value = 0; //this is value of city list
  List<String> _cityList = new List(25);
  String _city;
  bool _search = false;

  @override
  void initState() {
    super.initState();
    _cityList[0] = "Ampara";
    _cityList[1] = "Anuradhapura";
    _cityList[2] = "Badulla";
    _cityList[3] = "Batticaloa";
    _cityList[4] = "Colombo";
    _cityList[5] = "Galle";
    _cityList[6] = "Gampaha";
    _cityList[7] = "Hambantota";
    _cityList[8] = "Jaffna";
    _cityList[9] = "Kalutara";
    _cityList[10] = "Kandy";
    _cityList[11] = "Kegalle";
    _cityList[12] = "Kilinochchi";
    _cityList[13] = "Kurunegala";
    _cityList[14] = "Mannar";
    _cityList[15] = "Matale";
    _cityList[16] = "Matara";
    _cityList[17] = "Monaragala";
    _cityList[18] = "Mullaitivu";
    _cityList[19] = "Nuwara Eliya";
    _cityList[20] = "Polonnaruwa";
    _cityList[21] = "Puttalam";
    _cityList[22] = "Ratnapura";
    _cityList[23] = "Trincomalee";
    _cityList[24] = "Vavuniya";
    _city = _cityList[4];

    //this is for test
    getShopList();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: context, delegate: TestSearchDelegate());
                setState(() {
                  _search = !_search;
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  _search = false;

                  selectCity();
                }),
            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NotificationPage()));
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _search == true
                ? Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          hintText: 'Enter Shop Name'),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          createUIx(value);
                        });
                      },
                    ))
                : Container(
                    padding: EdgeInsets.all(5),
                    child: Wrap(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                        ),
                        Text(
                          "$_city",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
            shopCardList.length != 0
                ? Expanded(
                    child: Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: shopCardList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return shopCardList[index];
                          }),
                    ),
                  )
                : Center(
                    child: Wrap(
                    children: [Center(child: Text("No data available"))],
                  ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          onPressed: () {
            // Navigator.of(context).push(new MaterialPageRoute(
            //     builder: (BuildContext context) => new Test()));
            getShopList();
          },
          tooltip: 'Increment',
          child: Icon(Icons.bubble_chart),
          backgroundColor: Colors.purple,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Icon(
                  Icons.bubble_chart,
                  size: 90,
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Profile()));
                },
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(Icons.event_available),
                title: Text('Upcoming ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Upcoming()));
                },
              ),
              ListTile(
                leading: Icon(Icons.timeline),
                title: Text('History',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new History()));
                },
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(Icons.face),
                title: Text('Hair Style',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(Icons.notifications_none),
                title: Text('Notification',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Payment()));
                },
              ),
              ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text('Contact us',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new ContactUs()));
                  }),
              Divider(
                thickness: 2,
              ),
              /* ListTile(
                      leading: Icon(Icons.event_available),
                      title: Text('LogIn',
                              style: TextStyle(fontWeight:FontWeight.bold)
                      ),
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: 
                              (BuildContext context) => new LoginScreen()));
                      },
                    ),*/

              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }

  //functions

  //this is to get shop details
  Future<void> getShopList() async {
    var result = await httpGet('shoplist', {
      "dist": _city,
    });
    if (result.ok) {
      print("shop details recived to Main");
      setState(() {
        shopList.clear();
        var inShop = result.data as List<dynamic>;
        inShop.forEach((inShop) {
          shopList.add(Shop.contact(
              inShop['salon_id'],
              inShop['shop_name'],
              inShop['salon_address'],
              inShop['district'],
              inShop['contact'],
              inShop['email'],
              inShop['about']));
          print(inShop['shop_name'].toString());
        });
        //print(shopList.length.toString());
        createUI();
      });
    } else if (!result.ok) {
      // final snackBar = SnackBar(content: Text('Connection Error'));
      // Scaffold.of(context).showSnackBar(snackBar);
      shopList.clear();
      setState(() {});
      print("Unable to get data to Main");
    }
  }

  //adding shop object to ui part  with
  createUI() {
    shopCardList.clear();
    int i;
    for (i = 0; i < shopList.length; i++) {
      shopCardList.add(ShopCard(shopList[i]));
    }
  }

  createUIx(String val) {
    shopCardList.clear();
    int i;
    //print(val.length);

    for (i = 0; i < shopList.length; i++) {
      //print(shopList[i].shopName.substring(0, val.length));
      if (shopList[i].shopName.substring(0, val.length) == val) {
        shopCardList.add(ShopCard(shopList[i]));
      }
    }
  }

  void selectCity() {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                children: List<Widget>.generate(
                  25,
                  (int index) {
                    String _temp = _cityList.elementAt(index);
                    return Container(
                        margin: EdgeInsets.only(left: 3, right: 3),
                        child: ChoiceChip(
                          elevation: 5,
                          padding: EdgeInsets.all(5),
                          label: Text(
                            '$_temp',
                            style: TextStyle(fontSize: 20),
                          ),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _city = _cityList[_value];
                              getShopList();
                              Navigator.pop(context);
                            });
                          },
                        ));
                  },
                ).toList(),
              ),
            ),
          );
        });
  }
}
