import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int money = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Mirus Global'),
        ),
        body: Center(
          child: Text(
            'Quarterly earnings:  ₦$money',
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 27,
                fontWeight: FontWeight.w700),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              money++;
            });
          },
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
        ));
  }
}
