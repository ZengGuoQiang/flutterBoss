import 'package:flutter/material.dart';

class HousePage extends StatefulWidget {
  @override
  _HousePage createState() => _HousePage();
}

class _HousePage extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child:new Text(
          'house',
          style: new TextStyle(fontSize: 25.0,color: Color.fromARGB(127, 127, 127, 127)),
          )
      ),
    );
  }
}
