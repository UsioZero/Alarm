import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Alarm extends StatefulWidget {

  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
      ),
    );
  }

  @override
  _Alarm createState() => _Alarm();
}

class _Alarm extends State<Alarm> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
      new FlutterLocalNotificationsPlugin();
  TextEditingController _timeController = TextEditingController();
  var initSetAndroid;
  var initSetIos;
  var initSet;
  int _timerTime = 10;
  String _timeInput;

  void _buttonPressed(){
    _timeInput = _timeController.text;
    _timeController.clear();

      _timerTime = 
      (int.parse(_timeInput[7])) + (int.parse(_timeInput[6]))*10 + 
      60*((int.parse(_timeInput[4])) + (int.parse(_timeInput[3]))*10) +
      3600*((int.parse(_timeInput[1])) + (int.parse(_timeInput[0]))*10);
    _showNotificaton();
  }

  void _showNotificaton() async{
    await _demoNotify();
  }

  Future<void> _demoNotify() async{
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

  @override
  void initState() {
    super.initState();
    initSetAndroid = 
        new AndroidInitializationSettings('hourglasses');
    initSetIos = 
        new IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification
        );
    initSet = new InitializationSettings(initSetAndroid, initSetIos);
    flutterLocalNotificationsPlugin.initialize(
      initSet,
      onSelectNotification: onSelectNotification
    );
  }

  Future onSelectNotification(String payload) async{
    if(payload != null){
      debugPrint('Notify payload: $payload');
    }
    await Navigator.push(
      context, 
      new MaterialPageRoute(builder: (context)=> new SecondRoute())
    );
  }

  Future onDidReceiveLocalNotification(
    int id, String title, String body, String payload
  ) async{
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async{
                  Navigator.of(context, rootNavigator: true).pop();
                  await Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => SecondRoute()
                    )
                  );
              },
            )
          ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget button(){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.yellow,
        onPressed: _buttonPressed,
        child: Text(
          'Add timer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    }

    Widget _logo(){
      return  Padding(
        padding: EdgeInsets.only(top: 65),
       child: Container(
          child: Align(
            child: Text(
              'TIMER',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
              )
          )
        )
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black38
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10), 
              child: IconTheme(
                data: IconThemeData(color: Colors.blue),
                child: icon,
              ),
            )
          ),
        ),
      );
    }

    Widget _timeSet(String label){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom : 0, top:20),
              child: _input(
                Icon(Icons.hourglass_empty),
                '01:23:45',
                _timeController
              )
            ),
            button()
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        leading: Container(
          child: Icon(Icons.alarm, color: Colors.black87),
          padding: EdgeInsets.only(right: 5),               
          ),
      ),
      body:  Column(
          children: <Widget>[
            _logo(),
            _timeSet('TIME')
          ]
        )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showNotificaton,
      //   child: Icon(Icons.alarm_on),
      // ), 
    );
  }
}

class SecondRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: Container(
        child: Center(
          child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Back'),
              onPressed: (){Navigator.pop(context);},
            ),
        ),
      )
    );
  }
  
}