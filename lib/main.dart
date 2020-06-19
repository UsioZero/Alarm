import 'package:flutter/material.dart';
import 'package:allarm/screens/alarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Alarm',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
        ),
      home: Alarm(),
    );  }

}

