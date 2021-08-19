import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}
String data1="";
class _ImagesState extends State<Images> {

    myButton(){
    return Material(
      color: Color(0xFF795548),
      elevation: 18.0,
      shadowColor: Color(0x8FFFF603),
      borderRadius: BorderRadius.circular(28.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: RaisedButton( onPressed: ()async  { 
                     
                    var url = "http://192.168.43.54/cgi-bin/images.py";
                    // print("url");
                    var r = await http.get(url);
                    setState(() {
                    data1 = r.body;
                    });
                     print(data1);
                     },
                     color: Colors.deepOrangeAccent,
                  child: Text("Get images")),
               ),   
               Container(
                 padding: EdgeInsets.all(20.0),
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child:Text("Output of Images: \n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
               ),    
              
              ],
            ),
      
    );
  }

  myItems(){
    return Material(
      color: Colors.deepOrangeAccent,
      elevation: 18.0,
     shadowColor: Color(0x8FFF9603),
      borderRadius: BorderRadius.circular(28.0),
      child: SingleChildScrollView(
              child: Column(
              children: <Widget>[  
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
        title: Text("Docker Images",
        style:TextStyle(color:Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color(0xFF795548),
      ),

      body: StaggeredGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal:16.0,vertical:8.0),
        
        children: <Widget>[
          myButton(),
          myItems()
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 400.0),
          ],),
    );
  }
}