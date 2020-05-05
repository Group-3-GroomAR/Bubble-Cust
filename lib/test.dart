import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Bubble"),
      ),
      

      body: Card(
        shadowColor: Colors.grey,
        elevation: 50,        
        child:ListView(
          children: [
            Image.network("https://i2-prod.mirror.co.uk/incoming/article12479813.ece/ALTERNATES/s615/Mickey-Mouse.jpg",
            
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
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {

        },
        tooltip: 'Increment',
        child: Icon(Icons.bubble_chart),
        backgroundColor:Colors.purple,
      ),
    );
  }
}