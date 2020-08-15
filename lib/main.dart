import 'package:bubbletest/drawer/history.dart';
import 'package:bubbletest/drawer/notification.dart';
import 'package:bubbletest/drawer/profile.dart';
import 'package:bubbletest/drawer/upcoming.dart';
import 'package:bubbletest/test/specialisttile.dart';
import 'package:bubbletest/test/testsearchdelegate.dart';
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
  List<String> _cityList = new List(5);
  String _city;

  @override
  void initState() {
    super.initState();
    _cityList[0] = "Colombo";
    _cityList[1] = "Nuwara Eliya";
    _cityList[2] = "Kandy";
    _cityList[3] = "Gampaha";
    _cityList[4] = "Matara";
    _city = _cityList[0];

    //this is for test
    //getShop();
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
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text("Bubble",
          //   style: TextStyle(fontStyle: FontStyle.italic),
          // ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: TestSearchDelegate());
              },
            ),
            IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Wrap(
                              children: List<Widget>.generate(
                                5,
                                (int index) {
                                  String _temp = _cityList.elementAt(index);
                                  return Container(
                                      margin:
                                          EdgeInsets.only(left: 3, right: 3),
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
        body: Container(
          child: ListView(
            //padding: const EdgeInsets.all(5.0),
            children: [
              Container(
                color: Colors.purple,
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Recent Visits",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 15, left: 5, right: 5),
                //margin: EdgeInsets.all(5),
                //color: Colors.purple,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    border: Border.all(width: 1, color: Colors.purple)),
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SpecialistTile(
                        speciality: "Hair",
                        noOfDoctors: index,
                        backColor: Colors.white,
                      );
                    }),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),

              Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Wrap(
                    children: [
                      Text(
                        "All Sallon(",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                      Text(
                        "$_city)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),

              Padding(padding: EdgeInsets.only(top: 5)), //this is padding

              shopCardList.length != 0 ? shopCardList[0] : Text("No data"),
              shopCardList.length != 0 ? shopCardList[1] : Text("No data"),
              shopCardList.length != 0 ? shopCardList[2] : Text("No data"),

              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: shopList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ShopCard(shopList[index].shopName,
              //           shopList[index].shopAddress, shopList[index].district);
              //     }),

              // ShopCard("Dummy began", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon TTT", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIY", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYX", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
              // ShopCard("Salon LIYO", "@No.224A, Highlevel Road, Nugegoda ",
              //     "Beauty salon in Nugegoda "),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          onPressed: () {
            // Navigator.of(context).push(new MaterialPageRoute(
            //     builder: (BuildContext context) => new Test()));
            getShop(context);
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
              ),
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
  Future<void> getShop(BuildContext context) async {
    var result = await httpGet('shoplist');
    if (result.ok) {
      print("shop details recived");
      setState(() {
        shopList.clear();
        var in_shop = result.data as List<dynamic>;
        in_shop.forEach((in_shop) {
          shopList.add(Shop.contact(
              in_shop['salon_id'],
              in_shop['shop_name'],
              in_shop['salon_address'],
              in_shop['district'],
              in_shop['contact'],
              in_shop['email'],
              in_shop['about']
          ));
          //print(in_shop['contact'].toString());
        });
        print(shopList.length.toString());
        createUI();
        // print(shopList[0].shopName);
        // print(shopList[1].shopName);
        // print(shopList[2].shopName);
      });
    } else if (!result.ok) {
      // final snackBar = SnackBar(content: Text('Connection Error'));
      // Scaffold.of(context).showSnackBar(snackBar);
      shopList.clear();
      setState(() {});
      print("Unable to get data");
    }
  }

  //adding shop object to ui part
  createUI() {
    int i;
    for (i = 0; i < shopList.length; i++) {
      shopCardList.add(ShopCard(shopList[i]));
    }
  }
}
