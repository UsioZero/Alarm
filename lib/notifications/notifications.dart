import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SimpleNotification {
  static const AndroidNotificationDetails _androidDetails =
      AndroidNotificationDetails(
          'channel id', 'channel name', 'channel description',
          importance: Importance.Max,
          priority: Priority.High,
          ticker: 'test ticker');
  static const IOSNotificationDetails _iosDetails = IOSNotificationDetails();
  static const NotificationDetails _notificationDetails =
      NotificationDetails(_androidDetails, _iosDetails);

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  SimpleNotification(androidCallback, iosCallback) {
    var initSetAndroid = new AndroidInitializationSettings('hourglasses');
    var initSetIos = new IOSInitializationSettings(
        onDidReceiveLocalNotification: iosCallback);
    var initSet = new InitializationSettings(initSetAndroid, initSetIos);

    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    _flutterLocalNotificationsPlugin.initialize(initSet,
        onSelectNotification: androidCallback);
  }

  void notify(DateTime dayTime) {
    _flutterLocalNotificationsPlugin.schedule(
        0,
        "Time is over",
        "It's adventure time",
        dayTime,
        //  Day(dayTime.weekday), 
        // Time(dayTime.hour, dayTime.minute),
         _notificationDetails);
  }
}
