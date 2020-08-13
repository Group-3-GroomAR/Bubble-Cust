import 'package:flutter/material.dart';

class NotificationDetails extends StatefulWidget {
  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

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
                      height: 100,
                      width: 100,
                      decoration:BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/salonprofile.jpg')
                          ),
                          shape: BoxShape.circle,
                          border:Border.all(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),

                  Text(
                    "Beauty Salons",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Color(0xFF674ea7),
                      fontSize: 20.0,

                    ),

                  ),

                  SizedBox(height: 10),

                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color:Color(0xFF674ea7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "DATE",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "08/08/2020",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color:Color(0xFF674ea7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "TIME",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "9.00 AM",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color:Color(0xFF674ea7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "LOCATION",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width:180.0,
                        child: Text(
                          "No.65,Station Road, Wellawata",
                          style: TextStyle(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color:Color(0xFF674ea7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "QR CODE",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,),

                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.star,
                        color:Color(0xFF674ea7),
                      ),

                    ],
                  ),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(2),
                        height: 200,
                        width: 200,
                        decoration:BoxDecoration(
                            image: DecorationImage(

                                image: AssetImage('assets/images/qrcode.jpg')
                            ),
                            border:Border.all(
                                color: Colors.black,
                                width: 2
                            )


                        ) ,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}