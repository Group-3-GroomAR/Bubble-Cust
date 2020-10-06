import 'package:bubbletest/backend/http.dart';
import 'package:bubbletest/extra/reservation.dart';
import 'package:bubbletest/pages/appoinment.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  Upcoming({Key key}) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Reservation> reservationList = []; //this is to add all reservation
  String customerId;

  @override
  void initState() {
    customerId = "cus2";
    getReservation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upcoming"),
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
                            "Ref No:${makeEncript(reservationList[index].resID)}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Date:${reservationList[index].date.substring(0, 10)}",
                                  style: TextStyle(fontSize: 17)),
                              Text("Time:${reservationList[index].start_time}",
                                  style: TextStyle(fontSize: 17)),
                              Text(
                                  "Duration:${reservationList[index].duration} min",
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Appoinment(
                                        this.reservationList[index])));
                          },
                        ),
                      )));
            },
          ),
        ),
      ),
    );
  }

  Future<void> getReservation() async {
    var result = await httpGet('customerupcoming', {"customerId": customerId});

    if (result.ok) {
      print("upcoming reservation details recived to Main");
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

  String makeEncript(int x) {
    print(x);
    int val = 99 * x;
    val = val + 60;
    print(val);
    return val.toString();
  }
}
