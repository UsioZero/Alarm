import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'second_route.dart';
import 'package:allarm/show_notify.dart';

class Alarm extends StatefulWidget {

  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Alarm',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
      ),
    );
  }

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {

  ShowNotify showNotifyElement = ShowNotify();
  DateTime _dateTime;
  TimeOfDay _timeOfDay;
  int _timerTime = 10;
  var initSetAndroid;
  var initSetIos;
  var initSet;
  
  void _buttonPressed(){
    _dateTimeSet(context);

      // _timerTime = 
      // (int.parse(_timeInput[7])) + (int.parse(_timeInput[6]))*10 + 
      // 60*((int.parse(_timeInput[4])) + (int.parse(_timeInput[3]))*10) +
      // 3600*((int.parse(_timeInput[1])) + (int.parse(_timeInput[0]))*10);
      // showNotifyElement.showNotify(_timerTime);
  }

  Future<Null> _dateTimeSet(BuildContext context) async{
   await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2100)
    ).then((value) {
      setState(() {
        _dateTime = value;
      });
    });
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    ).then((value) {
      setState(() {
        _timeOfDay = value;
      });
    });
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
    showNotifyElement.flutterLocalNotificationsPlugin.initialize(
      initSet,
      onSelectNotification: onSelectNotification
    );
  }

  Future onSelectNotification(String payload) async{
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
          'Add alarm',
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
              'ALARM',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
              )
          )
        )
      );
    }

    // Widget _input(Icon icon, String hint, TextEditingController controller){
    //   return Container(
    //     padding: EdgeInsets.only(left: 20, right: 20),
    //     child: TextField(
    //       controller: controller,
    //       style: TextStyle(
    //         fontSize: 20,
    //         color: Colors.black,
    //       ),
    //       decoration: InputDecoration(
    //         hintStyle: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.black38
    //         ),
    //         hintText: hint,
    //         focusedBorder: OutlineInputBorder(
    //           borderSide: BorderSide(color: Colors.black, width: 3)
    //         ),
    //         enabledBorder: OutlineInputBorder(
    //           borderSide: BorderSide(color: Colors.black54, width: 1)
    //         ),
    //         prefixIcon: Padding(
    //           padding: EdgeInsets.only(left: 10, right: 10), 
    //           child: IconTheme(
    //             data: IconThemeData(color: Colors.blue),
    //             child: icon,
    //           ),
    //         )
    //       ),
    //     ),
    //   );
    // }
  
    Widget _dateTimeSet(){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom : 0, top:20),
              child:  Text(
                _timeOfDay == null? 'not set yet ' 
                : (DateFormat("dd-MM-yyyy").format(_dateTime) 
                + " "
                + _timeOfDay.toString().substring(10,15)).toString(), 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        leading: Container(
          child: Icon(Icons.alarm, color: Colors.black87),
          padding: EdgeInsets.only(right: 5),               
          ),
      ),
      body:  Column(
          children: <Widget>[
            _logo(),
            _dateTimeSet(),
            button()
          ]
        )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showNotificaton,
      //   child: Icon(Icons.alarm_on),
      // ), 
    );
  }
}