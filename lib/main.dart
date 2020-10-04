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
    _city = _cityList[0];

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
                showSearch(context: context, delegate: TestSearchDelegate());
              },
            ),
            IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
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
        body: Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: shopCardList.length,
              itemBuilder: (BuildContext context, int index) {
                return shopCardList[index];
              }),
        ),
        // body: Container(
        //   child: ListView(
        //     physics: NeverScrollableScrollPhysics(),
        //     //padding: const EdgeInsets.all(5.0),
        //     children: [
        //       Container(
        //         color: Colors.purple,
        //         padding: EdgeInsets.only(left: 5),
        //         child: Text(
        //           "Recent Visits",
        //           style: TextStyle(
        //             fontSize: 18,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),

        //       Container(
        //         padding: EdgeInsets.only(bottom: 15, left: 5, right: 5),
        //         //margin: EdgeInsets.all(5),
        //         //color: Colors.purple,
        //         height: 250,
        //         decoration: BoxDecoration(
        //             color: Colors.purple,
        //             borderRadius: BorderRadius.only(
        //                 bottomRight: Radius.circular(20),
        //                 bottomLeft: Radius.circular(20)),
        //             border: Border.all(width: 1, color: Colors.purple)),
        //         child: ListView.builder(
        //             itemCount: 10,
        //             shrinkWrap: true,
        //             scrollDirection: Axis.horizontal,
        //             itemBuilder: (context, index) {
        //               return SpecialistTile(
        //                 speciality: "Hair",
        //                 noOfDoctors: index,
        //                 backColor: Colors.white,
        //               );
        //             }),
        //       ),

        //       Padding(
        //         padding: EdgeInsets.only(top: 10),
        //       ),

        //       Container(
        //           padding: EdgeInsets.only(left: 5),
        //           child: Wrap(
        //             children: [
        //               Text(
        //                 "All Sallon(",
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               Icon(
        //                 Icons.location_on,
        //                 size: 18,
        //               ),
        //               Text(
        //                 "$_city)",
        //                 style: TextStyle(
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ],
        //           )),

        //       Padding(padding: EdgeInsets.only(top: 5)), //this is padding

        //       Container(
        //           // height: 200, // give it a fixed height constraint
        //           color: Colors.teal,
        //           // child ListView
        //           child: ListView.builder(
        //               padding: const EdgeInsets.all(8),
        //               itemCount: shopCardList.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return shopCardList[index];
        //               })),

        //       shopCardList.length != 0 ? shopCardList[0] : Text("No data"),
        //       shopCardList.length != 0 ? shopCardList[1] : Text("No data"),
        //       shopCardList.length != 0 ? shopCardList[2] : Text("No data"),
        //     ],
        //   ),
        // ),
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
  Future<void> getShopList() async {
    var result = await httpGet('shoplist');
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
          //print(in_shop['contact'].toString());
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

  //adding shop object to ui part
  createUI() {
    int i;
    for (i = 0; i < shopList.length; i++) {
      shopCardList.add(ShopCard(shopList[i]));
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
