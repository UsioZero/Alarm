import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:alarm/notifications/notifications.dart';

StatelessWidget addNewAlarmBtn(
    List simpleNotifications,
    Future _onAndroidSelectNotification,
    Future _onIOSSelectNotification,
    _buttonPressed(int i),
    setChange(void a)) {
  return FloatingActionButton(
      heroTag: 'plusTag',
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      //shape: ShapeBorder,
      child: Icon(Icons.add),
      onPressed: () {
        setChange(() {
          simpleNotifications.add(new SimpleNotification(
              _onAndroidSelectNotification,
              _onIOSSelectNotification,
              simpleNotifications.length));
        });
        _buttonPressed(simpleNotifications.length - 1);
      });
}
