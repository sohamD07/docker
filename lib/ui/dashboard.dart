import 'package:docker_ui/ui/exec.dart';
import 'package:docker_ui/ui/image.dart';
import 'package:docker_ui/manualcmd.dart';
import 'package:docker_ui/ui/ps.dart';
import 'package:docker_ui/ui/rm.dart';
import 'package:docker_ui/ui/run.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  myItems(IconData icon, String heading, int color) {
    return Material(
        color: Colors.white,
        elevation: 28.0,
        shadowColor: Colors.amber,
        borderRadius: BorderRadius.circular(28.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(14.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: 16.0,
                            ),
                          )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            heading,
                            style: TextStyle(
                              color: Color(color),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
          title: Text(
        "DockerApp",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      )),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cmd()),
              );
            },
            child: myItems(Icons.comment, "commands", 0xFFE64A19),
          ),

          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Images(),
                  ));
            },
            child: myItems(Icons.image, "images", 0xFF795548),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ps(),
                ),
              );
            },
            child: myItems(Icons.shop, "ps", 0xFFFF5252),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Run(),
                  ));
            },
            child: myItems(Icons.directions_run, "run", 0xFF03A9F4),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Rm(),
                ),
              );
            },
            child: myItems(Icons.remove, "rm", 0xFFFF9800),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exec(),
                ),
              );
            },
            child: myItems(Icons.play_arrow, "exec", 0xFF76FF03),
          ),


          // myItems(Icons.comment,"commands",0xFFE64A19),
          // myItems(Icons.image,"images",0xFFEA80FC),
          // myItems(Icons.shop,"ps",0xFFFF5252),
          // myItems(Icons.directions_run,"run",0xFF03A9F4),
          // myItems(Icons.remove,"rm",0xFFFF9800),
          // myItems(Icons.play_arrow,"exec",0xFF76FF03),
          // myItems(Icons.publish,"push",0xFF18FFFF),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 120.0),
         // StaggeredTile.extent(1, 130.0),
        ],
      ),
    );
  }
}
