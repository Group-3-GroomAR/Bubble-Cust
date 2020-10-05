import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          color: Colors.purple,
          child: Center(
            child: Wrap(
              children: [
                Center(
                  child: Icon(
                    Icons.bubble_chart,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "GroomAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Email:groomar@gmail.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: RaisedButton(
          color: Colors.white,
          padding:
          const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            _makePhoneCall('tel:773946332');
          },
          child: Wrap(
            children: [
              Text("Call Us",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
