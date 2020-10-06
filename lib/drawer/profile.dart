import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/drawer/profileedit.dart';
import 'package:bubbletest/extra/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var firstColor = Colors.deepPurple, secondColor = Colors.purple;
  String _name = "Name";
  String _district = "District";
  int _phone = 94;
  String _gender = "Gender";
  String _customerId = "cus2";
  @override
  void initState() {
    // TODO: implement initState
    // AuthService obj = AuthService();
    // print("Getting user${obj.getUser()}");
    getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   width: 200,
                  //   height: 200,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/images/profile.jpg'),
                  //     ),
                  //     shape: BoxShape.circle,
                  //     border: Border.all(
                  //       color: Colors.deepPurple,
                  //       width: 3,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Icon(
                      Icons.account_box,
                      size: 200,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    _name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _phone.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _district,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.people,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _gender == 'M' ? "Male" : "Female",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 250,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NiceButton(
        background: Colors.black,
        radius: 40,
        padding: const EdgeInsets.all(5),
        text: "Edit",
        icon: Icons.edit,
        gradientColors: [secondColor, firstColor],
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new ProfileEdit()));
        },
      ),
    );
  }

  //this function is to get the profile details
  Future<void> getCustomer() async {
    var result = await httpGet('customerdetail', {
      "customerId": _customerId,
    });
    if (result.ok) {
      var inCust = result.data as List<dynamic>;
      var inCustx = inCust[0];
      setState(() {
        _name = inCustx[0]['customer_name'];
        _gender = inCustx[0]['customer_gender'];
        _district = inCustx[0]['customer_district'];
        _phone = inCustx[0]['customer_phone'];
      });
    } else {
      print("Unable to get data");
    }
  }
}
