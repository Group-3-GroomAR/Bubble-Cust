import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/reservation.dart';
import 'package:flutter/material.dart';
class History extends StatefulWidget {
  History({Key key}) : super(key: key);
  @override
  _HistoryState createState() => _HistoryState();
}
class _HistoryState extends State<History> {
  List<Reservation> reservationList = []; //this is to add all reservation
  String customerId;
  @override
  void initState() {
    customerId = "cus2";
    getReservation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: reservationList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // margin: EdgeInsets.all(10),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 6,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                          "Date:${reservationList[index].date.substring(0, 10)}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time:${reservationList[index].start_time}",
                                style: TextStyle(fontSize: 17)),
                            Text(
                                "Duration:${reservationList[index].duration} min",
                                style: TextStyle(fontSize: 17))
                          ],
                        ),
                      ),
                    )));
          },
        ),
      ),
    );
  }
  Future<void> getReservation() async {
    var result = await httpGet('customerhistory', {"customerId": customerId});
    if (result.ok) {
      print("History reservation details recived to Main");
      setState(() {
        reservationList.clear();
        var inRes = result.data as List<dynamic>;
        inRes.forEach((inRes) {
          reservationList.add(Reservation(
              inRes['id'],
              inRes['date'],
              inRes['duration'],
              inRes['start_time'],
              inRes['end_time'],
              inRes['total'],
              inRes['customer_id'],
              inRes['payment_id'],
              inRes['note'],
              inRes['salon_id']));
          //print(in_shop['contact'].toString());
        });
        print("Length of history${reservationList.length.toString()}");
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