// LIBRARIES
import 'package:alarm/screens/alarms/alarm_alert.dart';
import 'package:flutter/material.dart';
// COMPONENTS
import 'screens/alarms/alarm_list.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
      home: AlarmList(),
      routes: {
        '/alarms-list': (BuildContext context) => AlarmList(),
        '/alert': (BuildContext context) => AlarmAlertScreen(),
      },
    );
  }
}
