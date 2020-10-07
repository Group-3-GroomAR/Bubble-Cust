import 'package:bubbletest/backend/http.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String _name = "Name";
  String _district = "District";
  int _phone = 94;
  String _gender = "Gender";
  String _customerId = "cus2";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 17),
            ),
            TextFormField(
              onChanged: (value) {
                _name = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  hintText: _name),
            ),
            Text(
              "District",
              style: TextStyle(fontSize: 17),
            ),
            TextFormField(
              onChanged: (value) {
                _district = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  hintText: _district),
            ),
            Text(
              "Phone",
              style: TextStyle(fontSize: 17),
            ),
            TextFormField(
              onChanged: (value) {
                _phone = int.parse(value);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  hintText: _phone.toString()),
            ),
            Text(
              "Gender",
              style: TextStyle(fontSize: 17),
            ),
            TextFormField(
              onChanged: (value) {
                _gender = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  hintText: _gender),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            // Validate returns true if the form is valid, or false
            // otherwise.
            if (_formKey.currentState.validate()) {
              changeCustomer();
            }
          }),
    );
  }

  Future<void> changeCustomer() async {
    var result = await httpPost("changecustomer", {
      "customerId": _customerId,
      "name": _name,
      "district": _district,
      "phone": _phone,
      "gender": _gender.substring(0, 1)
    });
    if (result.ok) {
      print("Success");
      Navigator.pop(context);
      Navigator.pop(context);
    } else if (!result.ok) {
      print("Unable to insert data");
    }
  }

  //this function is to get the profile details
  Future<void> getCustomer() async {
    var result = await httpGet('customerdetail', {
      "customerId": _customerId,
    });
    if (result.ok) {
      var inCust = result.data as List<dynamic>;
      var inCustx = inCust[0];
      setState(() {
        _name = inCustx[0]['customer_name'];
        _gender = inCustx[0]['customer_gender'];
        _district = inCustx[0]['customer_district'];
        _phone = inCustx[0]['customer_phone'];
      });
    } else {
      print("Unable to get data");
    }
  }
}
