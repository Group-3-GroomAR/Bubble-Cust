import 'package:bubbletest/extra/reservation.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            FlutterLogo(size: 500),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.05,
                minChildSize: 0.05,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.blue[800],
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
}
