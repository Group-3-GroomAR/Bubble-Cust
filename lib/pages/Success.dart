import 'package:flutter/material.dart';

class Success extends StatelessWidget {
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
                    Icons.check_circle,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "Reservaiton Success",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
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
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Wrap(
            children: [
              Text("Go to Home",
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
}
