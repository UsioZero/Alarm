// LIBRARIES
import 'package:day_selector/day_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// COMPONENTS
import 'package:alarm/notifications/notifications.dart';
import 'package:alarm/screens/alarms/alarm_alert.dart';
import 'package:flutter/rendering.dart';

class AlarmList extends StatefulWidget {
  @override
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State<AlarmList> {
  List<SimpleNotification> simpleNotifications = List();

  TimeOfDay selectedTime;
  TimeOfDay _timeOfDay = TimeOfDay.now();

  void _buttonPressed(i) {
    _setTime(context).then((value) {
      simpleNotifications[i].notify(_timeOfDay);
    });
  }

  Future _setTime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        if (value != null) _timeOfDay = value;
      });
    });
  }
  // Notification handling

  Future<dynamic> _onAndroidSelectNotification(String payload) async {
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

  Widget _buildAlarmHeader(SimpleNotification oneNotify) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: Container(
          child: Icon(
            Icons.alarm,
            color: Colors.black,
          ),
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1, color: Colors.black))),
        ),
        title: Text(
          oneNotify.dateTime.toString().substring(10, 15),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmBody(SimpleNotification oneNotify) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Set only one day',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          DaySelector(
            onChange: (value) {
              if (DaySelector.monday & value ==
                  DaySelector.monday) {
                oneNotify.daySel[0] = true;
              }
              if (DaySelector.monday & value == 0) {
                oneNotify.daySel[0] = false;
              }

              if (DaySelector.tuesday & value ==
                  DaySelector.tuesday) {
                oneNotify.daySel[1] = true;
              }
              if (DaySelector.tuesday & value == 0) {
                oneNotify.daySel[1] = false;
              }

              if (DaySelector.wednesday & value ==
                  DaySelector.wednesday) {
                oneNotify.daySel[2] = true;
              }
              if (DaySelector.wednesday & value == 0) {
                oneNotify.daySel[2] = false;
              }

              if (DaySelector.thursday & value ==
                  DaySelector.thursday) {
                oneNotify.daySel[3] = true;
              }
              if (DaySelector.thursday & value == 0) {
                oneNotify.daySel[3] = false;
              }

              if (DaySelector.friday & value ==
                  DaySelector.friday) {
                oneNotify.daySel[4] = true;
              }
              if (DaySelector.friday & value == 0) {
                oneNotify.daySel[4] = false;
              }

              if (DaySelector.saturday & value ==
                  DaySelector.saturday) {
                oneNotify.daySel[5] = true;
              }
              if (DaySelector.saturday & value == 0) {
                oneNotify.daySel[5] = false;
              }

              if (DaySelector.sunday & value ==
                  DaySelector.sunday) {
                oneNotify.daySel[6] = true;
              }
              if (DaySelector.sunday & value == 0) {
                oneNotify.daySel[6] = false;
              }
            },
            mode: DaySelector.modeFull,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                child: CircleAvatar(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    oneNotify.cancel();
                    simpleNotifications
                        .removeAt(oneNotify.index);
                  });
                },
              ),
              RaisedButton(
                splashColor: Theme.of(context).primaryColor,
                highlightColor: Theme.of(context).primaryColor,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  _buttonPressed(oneNotify.index);
                },
                child: Text(
                  'Set time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var addNewAlarmBtn = FloatingActionButton(
        heroTag: 'plusTag',
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        //shape: ShapeBorder,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            simpleNotifications.add(new SimpleNotification(
                _onAndroidSelectNotification,
                _onIOSSelectNotification,
                simpleNotifications.length));
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
      body: _alarmListView(),
      floatingActionButton: addNewAlarmBtn,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _alarmListView() {
    return Container(
      color: Colors.yellow.withOpacity(0.2),
      child: Theme(
        data: Theme.of(context)
            .copyWith(cardColor: Colors.yellow.withOpacity(0.6)),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int i, bool isExpanded) => setState(() {
                  simpleNotifications[i].isExpanded = !isExpanded;
                }),
              children: simpleNotifications
                  .map<ExpansionPanel>((SimpleNotification oneNotify) =>
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) => _buildAlarmHeader(oneNotify),
                      body: _buildAlarmBody(oneNotify),
                      isExpanded: oneNotify.isExpanded)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
