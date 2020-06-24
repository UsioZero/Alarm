// LIBRARIES
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// COMPONENTS
import 'package:alarm/notifications/notifications.dart';
import 'package:alarm/screens/alarms/alarm_alert.dart';

class AlarmsScreen extends StatefulWidget {
  @override
  AlarmsScreenState createState() => AlarmsScreenState();
}

class AlarmsScreenState extends State<AlarmsScreen> {
  List simpleNotifications = List();

  DateTime _dateTime;
  DateTime selectedTime;
  DateTime selectedTime2;
  TimeOfDay _timeOfDay;
  String _timerTimeString = 'not set yet';

  void _buttonPressed() {
    _dateSet(context).then((value) {
      _timeSet(context).then((value) {
        _waitTimeFuture(context);
      });
    });
  }

  Future _waitTimeFuture(BuildContext context) async {
    setState(() {
      selectedTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
          _timeOfDay.hour, _timeOfDay.minute);
      _timerTimeString = DateFormat('dd MMMM yyyy HH:mm').format(selectedTime);
    });
    simpleNotifications.add(new SimpleNotification(
        _onAndroidSelectNotification, _onIOSSelectNotification));
    simpleNotifications.last.notify(selectedTime, simpleNotifications.length);
  }

  Future<Null> _dateSet(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2100))
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  Future<Null> _timeSet(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value;
      });
    });
  }

  // Notification handling

  Future<dynamic> _onAndroidSelectNotification(String payload) async {
    await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new AlarmAlertScreen()));
  }

  Future _onIOSSelectNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlarmAlertScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  // widgets

  Widget _renderButton(BuildContext context) {
    return RaisedButton(
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.yellow,
      onPressed: _buttonPressed,
      child: Text(
        'New alarm',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _renderLogo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 65),
        child: Container(
            child: Align(
                child: Text(
          'ALARM',
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
        ))));
  }

  Widget _renderDateTimeInput(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0, top: 20),
            child: Text(
              _timerTimeString,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
        body: Column(children: <Widget>[
          _renderLogo(context),
          _renderDateTimeInput(context),
          _renderButton(context)
        ]));
  }
}
