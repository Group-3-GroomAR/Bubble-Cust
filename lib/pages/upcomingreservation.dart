import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/reservation.dart';
import 'package:flutter/material.dart';

class UpcomingReservation extends StatefulWidget {
  @override
  _UpcomingReservationState createState() => _UpcomingReservationState();
}

class _UpcomingReservationState extends State<UpcomingReservation> {
  List<Reservation> reservationList =
      []; //this is to add all reservation details
  String customerId = "cus2";

  @override
  void initState() {
    getReservation();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> getReservation() async {
    var result = await httpGet('customerupcomingreservation', {
      "customerId": customerId,
    });

    if (result.ok) {
      print("upcoming reservation details recived to Main");
      setState(() {
        reservationList.clear();
        var inRes = result.data as List<dynamic>;
        inRes.forEach((inRes) {
          // reservationList.add(Reservation(
          //     inRes['id'],
          //     inRes['date'],
          //     inRes['duration'],
          //     inRes['start_time'],
          //     inRes['end_time'],
          //     inRes['total'],
          //     inRes['customer_id'],
          //     inRes['payment_id'],
          //     inRes['note']));
          //print(in_shop['contact'].toString());
        });
        print(reservationList.length.toString());
        // createUI();
      });
    } else if (!result.ok) {
      // final snackBar = SnackBar(content: Text('Connection Error'));
      // Scaffold.of(context).showSnackBar(snackBar);
      reservationList.clear();
      setState(() {});
      print("Unable to get data to Main");
    }

    print(result.data);
  }
}
