import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/reservation.dart';
import 'package:bubbletest/extra/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'moredetails.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  List<Reservation> reservationList = []; //this is to add all reservation
  String customerId;
  @override
  void initState() {
    customerId = "cus2";
    getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today Event"),
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
                        leading: Icon(Icons.today),
                        title: Text(
                          reservationList[index].status == 0
                              ? "Status:Upcoming"
                              : "Status:Completed",
                          // "Date:${reservationList[index].date.substring(0, 10)}",
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
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("reqest begin");
            getShop();
            // var result = httpGet("tom");
            // httpGet("shop").then((value) => _result = value.data.toString());
            // setState(() {
            //   print(_result);
            // });
          },
          child: Icon(Icons.network_wifi)),*/
    );
  }

  Future<void> getNotification() async {
    var result = await httpGet('customernotification', {
      "customerId": customerId,
      "day": new DateTime.now().day,
      "month": new DateTime.now().month,
      "year": new DateTime.now().year
    });
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
