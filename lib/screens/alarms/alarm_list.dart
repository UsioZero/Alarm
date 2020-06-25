// LIBRARIES
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
// COMPONENTS
import 'package:alarm/notifications/notifications.dart';
import 'package:alarm/screens/alarms/alarm_alert.dart';

class AlarmList extends StatefulWidget {
  @override
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State<AlarmList> {
  List simpleNotifications = List();

  DateTime selectedTime;


  Future _waitTimeFuture(BuildContext context) async {
    setState(() {
      simpleNotifications.add(new SimpleNotification(
        _onAndroidSelectNotification, _onIOSSelectNotification));
    }); 
  }
  // Notification handling

  Future<dynamic> _onAndroidSelectNotification(String payload) async {
    await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new AlarmAlertScreen()));
  }

  Future _onIOSSelectNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlarmAlertScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        leading: Container(
          child: Icon(Icons.alarm, color: Colors.black87),
          padding: EdgeInsets.only(right: 5),
        ),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: simpleNotifications.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow.shade300),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal:10),
                      leading: Container(
                        child: Icon(Icons.alarm, color: Colors.black,),
                        padding: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.black
                            )
                          )
                        ),
                      ),
                      title: Text(
                          DateFormat('hh:mm').format(simpleNotifications[i].dateTime),
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                          ),
                      ),
                      subtitle: Text(
                        DateFormat('dd-MM-yyyy').format(simpleNotifications[i].dateTime)
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        //shape: ShapeBorder,
        child: Icon(Icons.add),
        onPressed: (){
          _waitTimeFuture(context);
        }
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
