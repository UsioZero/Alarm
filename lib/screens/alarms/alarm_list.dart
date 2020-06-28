// LIBRARIES
import 'dart:async';

import 'package:alarm/models/lib.dart';
import 'package:alarm/widgets/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlarmList extends StatefulWidget {
  @override
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State<AlarmList> {
  List<Alarm> _alarms = List();

  // HANDLERS

  void _onAddNewAlarm() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((selectedTime) {
      if (selectedTime != null) {
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        Alarm newAlarm = Alarm(currentTimestamp, selectedTime, []);

        setState(() {
          _alarms.add(newAlarm);
        });
      }
    })
        .catchError((error) {
      print(error);
    });
  }

  void _onAlarmExpanded(int alarmId, bool isExpanded) {
    setState(() {
      var updatedAlarm = _alarms.singleWhere((alarm) => alarm.id == alarmId);
      updatedAlarm.isExpanded = !isExpanded;
    });
  }

  // Notification handling
  Future _onAndroidSelectNotification(String payload) {
    print('On android push named');
    return Navigator.of(context).pushNamed('/alert');
  }

  Future _onIOSSelectNotification(
      int id, String title, String body, String payload) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () {
              print('On IOS select button pressed.');
              Navigator.of(context, rootNavigator: true).pop();
              return Navigator.of(context).pushNamed('/alert');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        leading: Container(
          child: Icon(Icons.alarm, color: Colors.black87),
          padding: EdgeInsets.only(right: 5),
        ),
      ),
      body: AlarmsListView(_alarms, _onAlarmExpanded),
      floatingActionButton: FloatingActionButton(
          heroTag: 'plusTag',
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          //shape: ShapeBorder,
          child: Icon(Icons.add),
          onPressed: _onAddNewAlarm
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
