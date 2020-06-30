//LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  TimeOfDay _dateTime = TimeOfDay.now();
  get dateTime => _dateTime;
  bool isExpanded = false;

  int index;

  static const AndroidNotificationDetails _androidDetails =
      AndroidNotificationDetails(
          'channel id', 'channel name', 'channel description',
          importance: Importance.Max,
          priority: Priority.High,
          ticker: 'test ticker',
          sound: RawResourceAndroidNotificationSound('alarm_sound'));
  static const IOSNotificationDetails _iosDetails = IOSNotificationDetails();
  NotificationDetails _notificationDetails =
      NotificationDetails(_androidDetails, _iosDetails);

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  SimpleNotification(androidCallback, iosCallback, index,
      {this.isExpanded = false}) {
    this._dateTime = _dateTime;
    this.index = index;
    var initSetAndroid = new AndroidInitializationSettings('hourglasses');
    var initSetIos = new IOSInitializationSettings(
        onDidReceiveLocalNotification: iosCallback);
    var initSet = new InitializationSettings(initSetAndroid, initSetIos);

    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    _flutterLocalNotificationsPlugin.initialize(initSet,
        onSelectNotification: androidCallback);
  }

  void cancel() {
    _flutterLocalNotificationsPlugin.cancel(7 * index);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 1);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 2);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 3);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 4);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 5);
    _flutterLocalNotificationsPlugin.cancel(7 * index + 6);
  }

  void notify(TimeOfDay _time, bool _isFirstTime, List<bool> _daySel) {
    cancel();
    _dateTime = _time;
    if (_isFirstTime) {
      _isFirstTime = false;
      _flutterLocalNotificationsPlugin.schedule(
          7 * index,
          "Time is over",
          "It's adventure _time",
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, _time.hour, _time.minute),
          _notificationDetails);
    } else {
      if (_daySel[0])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index,
            "Time is over",
            "It's adventure _time",
            Day.Monday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[1])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 1,
            "Time is over",
            "It's adventure _time",
            Day.Tuesday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[2])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 2,
            "Time is over",
            "It's adventure _time",
            Day.Wednesday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[3])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 3,
            "Time is over",
            "It's adventure _time",
            Day.Thursday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[4])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 4,
            "Time is over",
            "It's adventure _time",
            Day.Friday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[5])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 5,
            "Time is over",
            "It's adventure _time",
            Day.Saturday,
            Time(_time.hour, _time.minute),
            _notificationDetails);

      if (_daySel[6])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 6,
            "Time is over",
            "It's adventure _time",
            Day.Sunday,
            Time(_time.hour, _time.minute),
            _notificationDetails);
    }
  }
}
