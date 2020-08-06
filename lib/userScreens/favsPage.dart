import 'package:flutter/material.dart';

class FavsPage extends StatefulWidget {
  @override
  _FavsPageState createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourites')),
      body: Center(
        child: Text(
          'My Favourites',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
