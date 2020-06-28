import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

StatelessWidget addNewAlarmBtn(
    List simpleNotifications,
    _onAndroidSelectNotification,
    _onIOSSelectNotification,
    setTimeShowNotification(int i),
    addNewNotification()) {
  return FloatingActionButton(
      heroTag: 'plusTag',
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      //shape: ShapeBorder,
      child: Icon(Icons.add),
      onPressed: () {
        addNewNotification();
        setTimeShowNotification(simpleNotifications.length - 1);
      });
}
