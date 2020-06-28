// LIBRARIES
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// COMPONENTS
import 'package:alarm/notifications/simple_notification.dart';
import 'package:alarm/screens/alarms/alarm_alert.dart';
import 'package:flutter/rendering.dart';
import 'package:alarm/widgets/widgets_lib.dart';

class AlarmList extends StatefulWidget {
  @override
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State<AlarmList> {
  List<SimpleNotification> simpleNotifications = List();

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
      body: alarmListView(context, simpleNotifications, setTimeShowNotification,
          onDeleteBtnPressed, expansionCallback, onHeaderTap),
      floatingActionButton: addNewAlarmBtn(
          simpleNotifications,
          _onAndroidSelectNotification,
          _onIOSSelectNotification,
          setTimeShowNotification,
          addNewNotification),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onDeleteBtnPressed(notification) {
    setState(() {
      notification.cancel();
      simpleNotifications.removeAt(notification.index);
    });
  }

  void expansionCallback(int i, bool isExpanded) {
    setState(() {
      simpleNotifications[i].isExpanded = !isExpanded;
    });
  }

  void addNewNotification() {
    setState(() {
      simpleNotifications.add(new SimpleNotification(
          _onAndroidSelectNotification,
          _onIOSSelectNotification,
          simpleNotifications.length));
    });
  }

  void onHeaderTap(SimpleNotification oneNotify) {
    setState(() {
      oneNotify.isExpanded = !oneNotify.isExpanded;
    });
  }

  Future setTimeShowNotification(i) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        simpleNotifications[i]
            .notify((value != null) ? value : TimeOfDay.now());
      });
    });
  }
}
