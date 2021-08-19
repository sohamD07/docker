import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Exec extends StatefulWidget {
  @override
  _ExecState createState() => _ExecState();
}
String data1="";
class _ExecState extends State<Exec> {
    String a="";
    String b="";
    String data1="";

    myButton(){
    return Material(
      color:Color(0xFF76FF03),
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

                  border: OutlineInputBorder(),
                  hintText: "Enter Docker OS name to Execute",
                  prefixIcon: Icon(Icons.tablet_android),
                ),
              ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child:  FlatButton(
                  onPressed: () async {
                    var url = "http://192.168.43.54/cgi-bin/exec.py?p=${a}";
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
     backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Exec",
        style:TextStyle(color:Colors.black),
        textAlign: TextAlign.center,
      ),
       backgroundColor: Color(0xFF76FF03),
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
          StaggeredTile.extent(2, 180.0),
          StaggeredTile.extent(2, 340.0),
          ],),
    );
  }
}