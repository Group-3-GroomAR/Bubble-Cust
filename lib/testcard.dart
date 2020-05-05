import 'package:flutter/material.dart';

class TestCard extends StatefulWidget {
  TestCard({Key key}) : super(key: key);

  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Card(
         elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.grey,        
        child:Column(
          children: [
            Card(
              elevation: 6,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-5geuz6_4e1954c9.jpeg?region=0,0,600,600',
                fit: BoxFit.fill,
                // height: 200,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            
            Container(
              margin: EdgeInsets.all(10),
              padding:EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Mickey Mouse",
                    style: TextStyle(fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.star,
                    color: Colors.orange,),
                    Icon(Icons.star,
                    color: Colors.orange,),
                    Icon(Icons.star,
                    color: Colors.orange,),
                    Icon(Icons.star,
                    color: Colors.grey
                    ),
                    Icon(Icons.star,
                    color: Colors.grey
                    ),
                    Text("4.5(413)",
                      style: TextStyle(color: Colors.grey),
                      )

                    ],
                  ),
                  Row(
                    children: [
                      Text("@.Disney",
                        style: TextStyle(color: Colors.black),)
                    ],
                  ),
                  Wrap(
                    children: [
                      Text("Mickey Mouse is a cartoon character and the mascot of The Walt Disney Company. He was created by Walt Disney and Ub Iwerks at the Walt Disney Studios in 1928. An anthropomorphic mouse who typically wears red shorts, large yellow shoes, and white gloves, Mickey is one of the world's most recognizable characters.",
                        style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  
                  Divider(

                  ),

                  Row(
                    children: [
                      Text("Tonight's availability",
                        style: TextStyle(color: Colors.black,
                        fontSize: 20),)
                    ],
                  ),

                  Row(
                    
                    children: [
                      Chip(label: Text("5:30PM"),elevation: 5,),
                      Chip(label: Text("7:30PM",style: TextStyle(color: Colors.deepPurple),),elevation: 5,backgroundColor: Colors.purple.shade100,),
                      Chip(label: Text("8:00PM"),elevation: 5,),
                      Chip(label: Text("9:00PM"),elevation: 5,),
                    ],
                  ),

                  Row(
                    
                    children: [
                      FlatButton(onPressed: ()
                      {}, 
                      child:Text("RESERVE",style: TextStyle(color: Colors.deepPurple),))
                    ],
                  ),




                ],
              ),            
              
            )
          ],
        )
      ),
    );
  }
}