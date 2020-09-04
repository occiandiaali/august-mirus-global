import 'package:flutter/material.dart';

// See: https://www.youtube.com/watch?v=Jg-R3odV3RA&list=PLZ_j4oC7OFFID5xsX_VhLUOZg-P_t5dFO&index=9

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar:
          AppBar(elevation: 0.0, title: Text('Admin Home'), centerTitle: true),
      //endDrawer: Drawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.deepPurple,
                maxRadius: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.chat_bubble),
                    Text('Messages'),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.deepPurple,
                maxRadius: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.people),
                    Text('Users'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.deepPurple,
                maxRadius: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.history),
                    Text('Orders'),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.deepPurple,
                maxRadius: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.dashboard),
                    Text('Products'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
