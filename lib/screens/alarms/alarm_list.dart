// LIBRARIES
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
  //SimpleNotification notification;

  @override
  void initState() {
    //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    //       FlutterLocalNotificationsPlugin();
    //   var initializationSettingsAndroid =
    //       AndroidInitializationSettings('hourglasses');
    //   var initializationSettingsIOS = IOSInitializationSettings(
    //       onDidReceiveLocalNotification: _onIOSSelectNotification);
    //   var initializationSettings = InitializationSettings(
    //       initializationSettingsAndroid, initializationSettingsIOS);
    //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //       onSelectNotification: _onAndroidSelectNotification);
    setState(() {});
    super.initState();
  }

  // HANDLERS
  void _onAddNewAlarm() {
    setState(() {
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      var newAlarm = Alarm(currentTimestamp, TimeOfDay.now(),
          [false, false, false, false, false, false, false]);
      _alarms.add(newAlarm);
    });
  }

  void _onAlarmExpanded(int alarmId, bool isExpanded) {
    setState(() {
      _alarms[alarmId].isExpanded = !_alarms[alarmId].isExpanded;
      isExpanded = !_alarms[alarmId].isExpanded;
    });
  }

  void _onDeleteAlarm(int alarmId) {
    setState(() {
      _alarms.removeWhere((alarm) => alarm.id == alarmId);
    });
  }

  void _onSetTimeAlarm(int alarmId, List<bool> daySelected) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        setState(() {
          _alarms.singleWhere((element) => element.id == alarmId).time = value;
        });
      }
    });
  }

  // Notification handling
  // Future _onAndroidSelectNotification(String payload) {
  //   print('On android push named');
  //   return Navigator.of(context).pushNamed('/alert');
  // }

  // Future _onIOSSelectNotification(
  //     int id, String title, String body, String payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: Text(title),
  //       content: Text(body),
  //       actions: [
  //         CupertinoDialogAction(
  //           isDefaultAction: true,
  //           child: Text('Ok'),
  //           onPressed: () async {
  //             Navigator.of(context, rootNavigator: true).pop();
  //             await Navigator.pushNamed(context, '/alert');
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

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
      body: AlarmsListView(
          _alarms, _onAlarmExpanded, _onDeleteAlarm, _onSetTimeAlarm),
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
