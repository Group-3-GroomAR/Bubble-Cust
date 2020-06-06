import 'package:flutter/material.dart';

class SpecialistTile extends StatelessWidget {

  
  final String speciality;
  final int noOfDoctors;
  final Color backColor;
  SpecialistTile({@required this.speciality
    ,@required this.noOfDoctors, @required this.backColor});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 150,
      
    //   margin: EdgeInsets.only(right: 16),
    //   decoration: BoxDecoration(
        
    //     color: backColor,
    //     borderRadius: BorderRadius.circular(24)
    //   ),
    //   padding: EdgeInsets.only(top: 16,right: 16,left: 16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(speciality, style: TextStyle(
    //         color: Colors.purple,
    //         fontSize: 20
    //       ),),
    //       SizedBox(height: 6,),
    //       Text("$noOfDoctors Salon", style: TextStyle(
    //         color: Colors.purple,
    //         fontSize: 13
    //       ),),
    //        //Image.asset('images/scissors.jpg', height: 160,)
    //     ],
    //   ),
    // );
    return Container(
      width: 150,
      height: 150,
      child: Card(
        elevation: 10,
        

      ),
    );
  }
}