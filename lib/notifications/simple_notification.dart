//LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  TimeOfDay _dateTime = TimeOfDay.now();
  get dateTime => _dateTime;

  bool _isFirstTime = true;
  bool isExpanded = false;

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

  void cancel(int notificationId) {
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 1);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 2);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 3);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 4);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 5);
    _flutterLocalNotificationsPlugin.cancel(7 * notificationId + 6);
  }

  void notify(TimeOfDay time, int notificationId, List<bool> daySel) {
    cancel(notificationId);
    _dateTime = time;
    print('notification:');
    print(
        'Day selected ${daySel[0]} ${daySel[1]} ${daySel[2]} ${daySel[3]} ${daySel[4]} ${daySel[5]} ${daySel[6]} \ntime: $time\nnotificationId: $notificationId');
    if (_isFirstTime) {
      _isFirstTime = false;
      _flutterLocalNotificationsPlugin.schedule(
          7 * notificationId,
          "Time is over",
          "It's adventure time",
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, time.hour, time.minute),
          _notificationDetails);
    } else {
      if (daySel[0])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId,
            "Time is over",
            "It's adventure time",
            Day.Monday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[1])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 1,
            "Time is over",
            "It's adventure time",
            Day.Tuesday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[2])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 2,
            "Time is over",
            "It's adventure time",
            Day.Wednesday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[3])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 3,
            "Time is over",
            "It's adventure time",
            Day.Thursday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[4])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 4,
            "Time is over",
            "It's adventure time",
            Day.Friday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[5])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 5,
            "Time is over",
            "It's adventure time",
            Day.Saturday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel[6])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * notificationId + 6,
            "Time is over",
            "It's adventure time",
            Day.Sunday,
            Time(time.hour, time.minute),
            _notificationDetails);
    }
  }
}
