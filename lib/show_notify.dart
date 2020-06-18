import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ShowNotify{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
        new FlutterLocalNotificationsPlugin();

  Future<void> showNotify(int _timerTime) async{
      var _durationTime = DateTime.now().add(Duration(seconds: _timerTime));
      var androidChannelSpecifics = AndroidNotificationDetails(
        'channel id', 
        'channel name', 
        'channel description',
        importance: Importance.Max, 
        priority: Priority.High, 
        ticker: 'test ticker'
        );
      var iOSChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = 
        NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
      await flutterLocalNotificationsPlugin.schedule(
        0, 
        "Time is over", 
        "It's adventure time", 
        _durationTime,
        platformChannelSpecifics,
        payload: 'test payload'
      );
    }

}