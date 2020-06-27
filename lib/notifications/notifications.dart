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
  bool isExpanded;

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
    //cancel();
    // _dateTime = time;
    // print(
    //     'Day selected ${daySel[0]} ${daySel[1]} ${daySel[2]} ${daySel[3]} ${daySel[4]} ${daySel[5]} ${daySel[6]} /n $time');
    // if (_isFirstTime) {
    //   _isFirstTime = false;
    //   _flutterLocalNotificationsPlugin.schedule(
    //       7 * index,
    //       "Time is over",
    //       "It's adventure time",
    //       DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, time.hour, time.minute),
    //       _notificationDetails);
    // } else {
    //   print(
    //       'Day selected ${daySel[0]} ${daySel[1]} ${daySel[2]} ${daySel[3]} ${daySel[4]} ${daySel[5]} ${daySel[6]} /n $time');
    //   print('hours: ${time.hour}, minutes: ${time.minute}');
    TimeOfDay dayTimeTest = TimeOfDay(
        hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute + 2);
    _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        //index,
        0,
        "Time is over",
        "It's adventure time",
        Day(DateTime.now().weekday),
        Time(dayTimeTest.hour, dayTimeTest.minute),
        //Time(time.hour, time.minute),
        _notificationDetails);

    // if (daySel[0])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(1),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[1])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 1,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(2),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[2])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 2,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(3),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[3])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 3,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(4),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[4])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 4,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(5),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[5])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 5,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(6),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);

    // if (daySel[6])
    //   _flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    //       7 * index + 6,
    //       "Time is over",
    //       "It's adventure time",
    //       Day(7),
    //       Time(time.hour, time.minute),
    //       _notificationDetails);
    // }
  }
}
