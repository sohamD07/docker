import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Run extends StatefulWidget {
  @override
  _RunState createState() => _RunState();
}
String data1="";
class _RunState extends State<Run> {
    String a="";
    String b="";
    String data1="";

    myButton(){
    return Material(
     // color:  Color(0xFF03A9F4),
      color: Colors.grey,
      elevation: 18.0,
      shadowColor: Color(0x8FFFF603),
      borderRadius: BorderRadius.circular(28.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              TextField(
                onChanged: (value) {
                  a = value;
                },
                autocorrect: false,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter ur Docker OS name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.tablet_android),
                ),
              ),
              TextField(
                onChanged: (value) {
                  b = value;
                },
                autocorrect: false,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                   hintStyle: TextStyle(color: Colors.white),
                  hintText: "Enter image name",
                  prefixIcon: Icon(Icons.tablet_android),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child:  FlatButton(
                  onPressed: () async {
                    var url =
                        "http://192.168.43.54/cgi-bin/run.py?p=${a}&q=${b}";
                    var response = await http.get(url);
                    setState(() {
                      data1 = response.body;
                    });
                    print(data1);
                  },
                  color: Colors.black,
                  child: Text('click here',style: TextStyle(color:Colors.white),)),
               ),
              ],
            ),
    );
  }

    myItems(){
    return Material(
      color: Colors.greenAccent,
      elevation: 18.0,
     shadowColor: Color(0x8FFF9603),
      borderRadius: BorderRadius.circular(28.0),
      child: SingleChildScrollView(
              child: Column(
              children: <Widget>[  
              Container(
                 padding: EdgeInsets.all(20.0),
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child:Text("Output of Command: \n",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
               ),
                Container( 
                 padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child:Text(
                        data1,
                        style: TextStyle(color: Colors.black,),
                    ),
                ),
              
              ],
            ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black38,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Docker Run",
        style:TextStyle(color:Colors.black),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color(0xFF03A9F4)
      ),

      body: StaggeredGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal:16.0,vertical:12.0),
        
        children: <Widget>[
          myButton(),
          myItems()
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 220.0),
          StaggeredTile.extent(2, 340.0),
          ],),
    );
  }
}