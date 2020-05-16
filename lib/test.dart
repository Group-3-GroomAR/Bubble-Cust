import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(          

      body: Container(
        constraints: BoxConstraints.expand(),   
        child: Container(
       // elevation: 50,        
        child:Image.network("https://cdn140.picsart.com/290740494018201.gif?to=min&r=1024",
        fit: BoxFit.fill,            
        ),
      ),
      ),

      floatingActionButton:RaisedButton(onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color:Colors.white,
          child: Wrap(        
              children: [
                IconButton(icon:Icon(Icons.face), onPressed: (){}),
                IconButton(icon:Icon(Icons.camera), onPressed: (){}),
                IconButton(icon:Icon(Icons.color_lens), onPressed: (){})
              ],

            ),) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
      
    );
  }
}