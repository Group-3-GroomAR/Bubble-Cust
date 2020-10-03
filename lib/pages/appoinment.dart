import 'package:bubbletest/extra/reservation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Appoinment extends StatefulWidget {
  final Reservation _reservation;
  Appoinment(this._reservation);
  @override
  _AppoinmentState createState() => _AppoinmentState(this._reservation);
}

class _AppoinmentState extends State<Appoinment> {
  Reservation _reservation;
  _AppoinmentState(this._reservation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      // appBar: AppBar(
      //   title: const Text('DraggableScrollableSheet'),
      // ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Center(
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
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.05,
                minChildSize: 0.05,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.white,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('Item $index'));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String makeEncript(int x) {
    print(x);
    int val = 99 * x;
    val = val + 60;
    print(val);
    return val.toString();
  }
}
