import 'package:flutter/material.dart';
import 'layPager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bogus Boss',
      home: MainPager()
      // new Scaffold(
      //     appBar: new AppBar(
      //         backgroundColor: Color.fromARGB(255, 175, 232, 133),
      //         title: new Align(
      //             //Align,padding,center等样式都是一个new 加上Align自身 居中可以相对于子元素的widthFactor,heightFactor对其方式alignment
      //             child: new Text(
      //           'Bogus Boss',
      //           style: new TextStyle(
      //             color: Color.fromARGB(255, 255, 255, 255),
      //             fontSize: 22.0,
      //           ),
      //         ))),
      //     body: new Center(
      //       child: new Text('ready'),
      //     ),),
    );
  }
}