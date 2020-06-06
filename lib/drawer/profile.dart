import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var firstColor= Colors.deepPurple, secondColor= Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
    title: Text("Profile"),
   ),
    body: ListView(
      children: <Widget>[
        Card(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 3,
                    ),
                  ),
                ),
                Text(
                  "Sundhar Pichchai",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "sundharsana1997@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "0771234567",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "114,Valvettithurai,Jaffna",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.description,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Looking for better service",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Edit",
                  icon: Icons.edit,
                  gradientColors: [
                    secondColor,firstColor
                  ],
                  onPressed: (){

                  },
                ),
                SizedBox(height: 250,),
              ],
            ),
          ),
        ),
      ],
    ),
  );
 }
}


