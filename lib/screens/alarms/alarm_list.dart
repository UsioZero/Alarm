// LIBRARIES

import 'package:alarm/models/lib.dart';
import 'package:alarm/notifications/simple_notification.dart';
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
  SimpleNotification _notification;

  @override
  void initState() {
    _notification = new SimpleNotification(context);
    super.initState();
  }

  // HANDLERS

  void _onAddNewAlarm() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((selectedTime) {
      if (selectedTime != null) {
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        int notifId;
        if (_alarms.isEmpty) {
          notifId = 0;
        } else {
          notifId = _alarms.last.notificationId + 1;
        }
        Alarm newAlarm = Alarm(currentTimestamp, notifId, selectedTime);
        setState(() {
          _alarms.add(newAlarm);
          _notification.notify(_alarms.last.time, _alarms.last.notificationId,
              [false, false, false, false, false, false, false], true);
        });
      }
    }).catchError((error) {
      print(error);
    });
  }

  void _onAlarmExpanded(int alarmId, bool isExpanded) {
    setState(() {
      var updatedAlarm = _alarms.singleWhere((alarm) => alarm.id == alarmId);
      updatedAlarm.isExpanded = !isExpanded;
    });
  }

  void _onAlarmDelete(int alarmId) {
    setState(() {
      var alarmDel =
          _alarms.singleWhere((alarm) => alarm.id == alarmId, orElse: () {
        return _alarms.last;
      });
      _notification.cancel(alarmDel.notificationId);
      _alarms.removeWhere((alarm) => alarm.id == alarmId);
    });
  }

  void _onSetTime(int alarmId, List<bool> selectedDays) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((selectedTime) {
      if (selectedTime != null) {
        setState(() {
          var alarm = _alarms.singleWhere((alarm) => alarm.id == alarmId);
          alarm.time = selectedTime;
          _notification.notify(
              alarm.time, alarm.notificationId, selectedDays, false);
        });
      }
    });
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
      body:
          AlarmsListView(_alarms, _onAlarmExpanded, _onAlarmDelete, _onSetTime),
      floatingActionButton: FloatingActionButton(
          heroTag: 'plusTag',
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          //shape: ShapeBorder,
          child: Icon(Icons.add),
          onPressed: () {
            _onAddNewAlarm();
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
