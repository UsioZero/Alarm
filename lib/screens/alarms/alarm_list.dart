// LIBRARIES
import 'package:day_selector/day_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// COMPONENTS
import 'package:alarm/notifications/notifications.dart';
import 'package:alarm/screens/alarms/alarm_alert.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class AlarmList extends StatefulWidget {
  @override
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State<AlarmList> {
  List simpleNotifications = List();

  TimeOfDay selectedTime;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  bool canRoute = false;

  void _buttonPressed(i) {
    _timeSet(context).then((value) {
      setState(() {
        canRoute = true;
      });
      simpleNotifications[i].notify(_timeOfDay, i);
    });
  }

  Future _timeSet(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        if (value != null) _timeOfDay = value;
      });
    });
  }
  // Notification handling

  Future<dynamic> _onAndroidSelectNotification(String payload) async {
    if (canRoute)
      await Navigator.of(context).push(
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
    var listView = Container(
      child: ListView.builder(
        itemCount: simpleNotifications.length,
        itemBuilder: (context, i) {
          return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Container(
                decoration: BoxDecoration(color: Colors.yellow.shade300),
                child: Column(children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      child: Icon(
                        Icons.alarm,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.black))),
                    ),
                    title: Text(
                      simpleNotifications[i]
                          .dateTime
                          .toString()
                          .substring(10, 15),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing:
                        Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    onTap: () {
                      setState(() {
                        (simpleNotifications[i].cardHeight == 0.0)
                            ? simpleNotifications[i].cardHeight = 180.0
                            : simpleNotifications[i].cardHeight = 0.0;
                      });
                    },
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    height: simpleNotifications[i].cardHeight,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Set only one day',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: DaySelector(
                              onChange: (value) {
                                if (DaySelector.monday & value ==
                                    DaySelector.monday) {
                                  simpleNotifications[i].daySel[0] = true;
                                }
                                if (DaySelector.monday & value == 0) {
                                  simpleNotifications[i].daySel[0] = false;
                                }

                                if (DaySelector.tuesday & value ==
                                    DaySelector.tuesday) {
                                  simpleNotifications[i].daySel[1] = true;
                                }
                                if (DaySelector.tuesday & value == 0) {
                                  simpleNotifications[i].daySel[1] = false;
                                }

                                if (DaySelector.wednesday & value ==
                                    DaySelector.wednesday) {
                                  simpleNotifications[i].daySel[2] = true;
                                }
                                if (DaySelector.wednesday & value == 0) {
                                  simpleNotifications[i].daySel[2] = false;
                                }

                                if (DaySelector.thursday & value ==
                                    DaySelector.thursday) {
                                  simpleNotifications[i].daySel[3] = true;
                                }
                                if (DaySelector.thursday & value == 0) {
                                  simpleNotifications[i].daySel[3] = false;
                                }

                                if (DaySelector.friday & value ==
                                    DaySelector.friday) {
                                  simpleNotifications[i].daySel[4] = true;
                                }
                                if (DaySelector.friday & value == 0) {
                                  simpleNotifications[i].daySel[4] = false;
                                }

                                if (DaySelector.saturday & value ==
                                    DaySelector.saturday) {
                                  simpleNotifications[i].daySel[5] = true;
                                }
                                if (DaySelector.saturday & value == 0) {
                                  simpleNotifications[i].daySel[5] = false;
                                }

                                if (DaySelector.sunday & value ==
                                    DaySelector.sunday) {
                                  simpleNotifications[i].daySel[6] = true;
                                }
                                if (DaySelector.sunday & value == 0) {
                                  simpleNotifications[i].daySel[6] = false;
                                }
                              },
                              mode: DaySelector.modeFull,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              verticalDirection: VerticalDirection.down,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: RaisedButton(
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    child: Text('delete',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                    onPressed: () {
                                      setState(() {
                                        simpleNotifications[i].cancel(i);
                                        simpleNotifications.removeAt(i);
                                      });
                                    },
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: RaisedButton(
                                    splashColor: Theme.of(context).primaryColor,
                                    highlightColor:
                                        Theme.of(context).primaryColor,
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      _buttonPressed(i);
                                    },
                                    child: Text(
                                      'Set time',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ));
        },
      ),
    );
    var button = FloatingActionButton(
        heroTag: 'plusTag',
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        //shape: ShapeBorder,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            canRoute = false;
            simpleNotifications.add(new SimpleNotification(
                _onAndroidSelectNotification, _onIOSSelectNotification));
          });
          _buttonPressed(simpleNotifications.length - 1);
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        leading: Container(
          child: Icon(Icons.alarm, color: Colors.black87),
          padding: EdgeInsets.only(right: 5),
        ),
      ),
      body: listView,
      floatingActionButton: button,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
