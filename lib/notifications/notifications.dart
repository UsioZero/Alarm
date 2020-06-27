//LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  TimeOfDay _dateTime = TimeOfDay.now();
  get dateTime => _dateTime;

  List<bool> daySel = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  var cardHeight = 0.0;

  bool _isFirstTime = true;

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

  SimpleNotification(androidCallback, iosCallback) {
    this._dateTime = _dateTime;
    var initSetAndroid = new AndroidInitializationSettings('hourglasses');
    var initSetIos = new IOSInitializationSettings(
        onDidReceiveLocalNotification: iosCallback);
    var initSet = new InitializationSettings(initSetAndroid, initSetIos);

    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    _flutterLocalNotificationsPlugin.initialize(initSet,
        onSelectNotification: androidCallback);
  }

  void cancel(int id) {
    _flutterLocalNotificationsPlugin.cancel(7 * id);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 1);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 2);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 3);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 4);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 5);
    _flutterLocalNotificationsPlugin.cancel(7 * id + 6);
  }

  void notify(
    TimeOfDay time,
    int id,
  ) {
    _dateTime = time;
    print(
        'Day selected ${daySel[0]} ${daySel[1]} ${daySel[2]} ${daySel[3]} ${daySel[4]} ${daySel[5]} ${daySel[6]} /n $time');
    if (_isFirstTime) {
      _flutterLocalNotificationsPlugin.schedule(
          7 * id,
          "Time is over",
          "It's adventure time",
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, time.hour, time.minute),
          _notificationDetails);
      _isFirstTime = false;
    } else {
      if (daySel[0])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id,
            "Time is over",
            "It's adventure time",
            Day(1),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[1])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 1,
            "Time is over",
            "It's adventure time",
            Day(2),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[2])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 2,
            "Time is over",
            "It's adventure time",
            Day(3),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[3])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 3,
            "Time is over",
            "It's adventure time",
            Day(4),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[4])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 4,
            "Time is over",
            "It's adventure time",
            Day(5),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[5])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 5,
            "Time is over",
            "It's adventure time",
            Day(6),
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[6])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * id + 6,
            "Time is over",
            "It's adventure time",
            Day(7),
            Time(time.hour, time.minute),
            _notificationDetails);
    }
  }
}
