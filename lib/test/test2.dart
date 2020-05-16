import 'package:bubbletest/test/specialisttile.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _TestState2 createState() => _TestState2();
}

class _TestState2 extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(            
            leading: Icon(Icons.menu),
            backgroundColor: Colors.purple,
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 150.0,
            bottom: PreferredSize(child: Container(
              padding:const EdgeInsets.all(5.0) ,
                height: 250,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return SpecialistTile(
                        speciality: "Hair",
                        noOfDoctors: index,
                        backColor: Colors.white,
                      );
                    }),
              ),
             preferredSize: Size.fromHeight(265.0)),
            actions: [
              IconButton(icon:Icon(Icons.search), onPressed: (){          
                  },),
                  IconButton(icon: Icon(Icons.location_on)     , onPressed: ()
                  {
                    showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text('This is the modal bottom sheet. Slide down to dismiss.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      );
                    });

                  }),
                  IconButton(icon: Icon(Icons.notifications), onPressed: (){})  

            ],
          ),

           SliverList(
            delegate: SliverChildListDelegate([
              ListTile(leading: Icon(Icons.volume_off), title: Text("Volume Off"),),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),
              ListTile(leading: Icon(Icons.volume_down), title: Text("Volume Down")),

            ]),
          )
        ],

      ),
    );
  }
}