import 'package:alarm/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildAlarmHeader(SimpleNotification oneNotify) {
  return Container(
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Container(
        child: Icon(
          Icons.alarm,
          color: Colors.black,
        ),
        padding: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1, color: Colors.black))),
      ),
      title: Text(
        DateFormat('hh:mm').format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            oneNotify.dateTime.hour,
            oneNotify.dateTime.minute)),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}
