//LIBRARIES
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  TimeOfDay dateTime = TimeOfDay.now();
  bool isExpanded = false;
  int index;
  BuildContext context;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  List<AndroidNotificationDetails> androidSpec = new List();
  List<NotificationDetails> notificationDetails = new List();

  SimpleNotification(this.context, this._flutterLocalNotificationsPlugin,
      {this.isExpanded = false}) {
    this.dateTime = dateTime;
    this.index = index;
  }

  void cancel(int index) {
    _flutterLocalNotificationsPlugin.cancel(7 * index);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 1);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 2);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 3);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 4);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 5);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 6);
  }

  void specInstall() {
    androidSpec = [];
    notificationDetails = [];
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    androidSpec.add(AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description',
        priority: Priority.High,
        sound: RawResourceAndroidNotificationSound('alarm_sound')));
    notificationDetails.add(NotificationDetails(androidSpec[0], null));
    notificationDetails.add(NotificationDetails(androidSpec[1], null));
    notificationDetails.add(NotificationDetails(androidSpec[2], null));
    notificationDetails.add(NotificationDetails(androidSpec[3], null));
    notificationDetails.add(NotificationDetails(androidSpec[4], null));
    notificationDetails.add(NotificationDetails(androidSpec[5], null));
    notificationDetails.add(NotificationDetails(androidSpec[6], null));
  }

  Future notify(TimeOfDay time, List<bool> daySel, int index) async {
    cancel(index);
    specInstall();
    dateTime = time;
    print('time: $dateTime');
    print('index: $index');

    if (daySel[0])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index,
          "Time is over",
          "It's adventure time",
          Day.Monday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[0]);

    if (daySel[1])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 1,
          "Time is over",
          "It's adventure time",
          Day.Tuesday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[1]);

    if (daySel[2])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 2,
          "Time is over",
          "It's adventure time",
          Day.Wednesday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[2]);

    if (daySel[3])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 3,
          "Time is over",
          "It's adventure time",
          Day.Thursday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[3]);

    if (daySel[4])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 4,
          "Time is over",
          "It's adventure time",
          Day.Friday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[4]);

    if (daySel[5])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 5,
          "Time is over",
          "It's adventure time",
          Day.Saturday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[5]);

    if (daySel[6])
      await _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
          7 * index + 6,
          "Time is over",
          "It's adventure time",
          Day.Sunday,
          Time(dateTime.hour, dateTime.minute),
          notificationDetails[6]);
    print('${daySel[6]}');
  }
}
