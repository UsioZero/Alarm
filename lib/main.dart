// LIBRARIES
import 'package:flutter/material.dart';
// COMPONENTS
import 'package:alarm/screens/alarms/alarms.dart';

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
      home: AlarmsScreen(),
    );  }

}

