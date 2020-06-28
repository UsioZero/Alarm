//LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  TimeOfDay _dateTime = TimeOfDay.now();
  get dateTime => _dateTime;

  Map<String, bool> daySel = {
    'monday': false,
    'tuesday': false,
    'wednesday': false,
    'thursday': false,
    'friday': false,
    'saturday': false,
    'sunday': false,
  };

  bool _isFirstTime = true;
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

  void notify(TimeOfDay time) {
    cancel();
    _dateTime = time;
    print(
        'Day selected ${daySel['monday']} ${daySel['tuesday']} ${daySel['wednesday']} ${daySel['thurseday']} ${daySel['friday']} ${daySel['saturday']} ${daySel['sunday']} \ntime: $time\nindex: $index');
    if (_isFirstTime) {
      _isFirstTime = false;
      _flutterLocalNotificationsPlugin.schedule(
          7 * index,
          "Time is over",
          "It's adventure time",
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, time.hour, time.minute),
          _notificationDetails);
    } else {
      if (daySel['monday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index,
            "Time is over",
            "It's adventure time",
            Day.Monday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['tuesday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 1,
            "Time is over",
            "It's adventure time",
            Day.Tuesday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['wednesday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 2,
            "Time is over",
            "It's adventure time",
            Day.Wednesday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['thurseday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 3,
            "Time is over",
            "It's adventure time",
            Day.Thursday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['friday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 4,
            "Time is over",
            "It's adventure time",
            Day.Friday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['saturday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 5,
            "Time is over",
            "It's adventure time",
            Day.Saturday,
            Time(time.hour, time.minute),
            _notificationDetails);

      if (daySel['sunday'])
        _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
            7 * index + 6,
            "Time is over",
            "It's adventure time",
            Day.Sunday,
            Time(time.hour, time.minute),
            _notificationDetails);
    }
  }
}
