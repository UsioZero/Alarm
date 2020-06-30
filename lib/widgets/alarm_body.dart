import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

class AlarmBody extends StatefulWidget {
  final List<bool> selectedDays;
  final int alarmId;
  final Function(int) onAlarmDelete;
  final Function(int, List<bool>) onSetTime;

  AlarmBody(
      this.selectedDays, this.alarmId, this.onAlarmDelete, this.onSetTime);

  @override
  _AlarmBodyState createState() => _AlarmBodyState();
}

class _AlarmBodyState extends State<AlarmBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DaySelector(
                onChange: (value) {
                  if (DaySelector.monday & value == DaySelector.monday) {
                    widget.selectedDays[0] = true;
                  }
                  if (DaySelector.monday & value == 0) {
                    widget.selectedDays[0] = false;
                  }

                  if (DaySelector.tuesday & value == DaySelector.tuesday) {
                    widget.selectedDays[1] = true;
                  }
                  if (DaySelector.tuesday & value == 0) {
                    widget.selectedDays[1] = false;
                  }

                  if (DaySelector.wednesday & value == DaySelector.wednesday) {
                    widget.selectedDays[2] = true;
                  }
                  if (DaySelector.wednesday & value == 0) {
                    widget.selectedDays[2] = false;
                  }

                  if (DaySelector.thursday & value == DaySelector.thursday) {
                    widget.selectedDays[3] = true;
                  }
                  if (DaySelector.thursday & value == 0) {
                    widget.selectedDays[3] = false;
                  }

                  if (DaySelector.friday & value == DaySelector.friday) {
                    widget.selectedDays[4] = true;
                  }
                  if (DaySelector.friday & value == 0) {
                    widget.selectedDays[4] = false;
                  }

                  if (DaySelector.saturday & value == DaySelector.saturday) {
                    widget.selectedDays[5] = true;
                  }
                  if (DaySelector.saturday & value == 0) {
                    widget.selectedDays[5] = false;
                  }

                  if (DaySelector.sunday & value == DaySelector.sunday) {
                    widget.selectedDays[6] = true;
                  }
                  if (DaySelector.sunday & value == 0) {
                    widget.selectedDays[6] = false;
                  }
                },
                mode: DaySelector.modeFull,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
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
                      print("Delete button pressed alarmId: $widget.alarmId");
                      widget.onAlarmDelete(this.widget.alarmId);
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    splashColor: Theme.of(context).primaryColor,
                    highlightColor: Theme.of(context).primaryColor,
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      widget.onSetTime(widget.alarmId, widget.selectedDays);
                    },
                    child: Text(
                      'Set time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//
//Widget buildAlarmBody(
//    SimpleNotification oneNotify,
//    BuildContext context,
//    List simpleNotifications,
//    setTimeShowNotification(int i),
//    onDeleteBtnPressed(SimpleNotification notification)) {
//  return Container(
//    child: Column(
//      children: <Widget>[
//        Text(
//          'Set only one day',
//          style: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 20,
//          ),
//        ),
//        DaySelector(
//          onChange: (value) {
//            if (DaySelector.monday & value == DaySelector.monday) {
//              oneNotify.daySel[0] = true;
//            }
//            if (DaySelector.monday & value == 0) {
//              oneNotify.daySel[0] = false;
//            }
//
//            if (DaySelector.tuesday & value == DaySelector.tuesday) {
//              oneNotify.daySel[1] = true;
//            }
//            if (DaySelector.tuesday & value == 0) {
//              oneNotify.daySel[1] = false;
//            }
//
//            if (DaySelector.wednesday & value == DaySelector.wednesday) {
//              oneNotify.daySel[2] = true;
//            }
//            if (DaySelector.wednesday & value == 0) {
//              oneNotify.daySel[2] = false;
//            }
//
//            if (DaySelector.thursday & value == DaySelector.thursday) {
//              oneNotify.daySel[3] = true;
//            }
//            if (DaySelector.thursday & value == 0) {
//              oneNotify.daySel[3] = false;
//            }
//
//            if (DaySelector.friday & value == DaySelector.friday) {
//              oneNotify.daySel[4] = true;
//            }
//            if (DaySelector.friday & value == 0) {
//              oneNotify.daySel[4] = false;
//            }
//
//            if (DaySelector.saturday & value == DaySelector.saturday) {
//              oneNotify.daySel[5] = true;
//            }
//            if (DaySelector.saturday & value == 0) {
//              oneNotify.daySel[5] = false;
//            }
//
//            if (DaySelector.sunday & value == DaySelector.sunday) {
//              oneNotify.daySel[6] = true;
//            }
//            if (DaySelector.sunday & value == 0) {
//              oneNotify.daySel[6] = false;
//            }
//          },
//          mode: DaySelector.modeFull,
//        ),
//        Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//          verticalDirection: VerticalDirection.down,
//          children: <Widget>[
//            RaisedButton(
//              color: Colors.red,
//              child: CircleAvatar(
//                child: Icon(
//                  Icons.delete,
//                  color: Colors.white,
//                ),
//                backgroundColor: Colors.red,
//              ),
//              onPressed: () => onDeleteBtnPressed(oneNotify),
//            ),
//            RaisedButton(
//              splashColor: Theme.of(context).primaryColor,
//              highlightColor: Theme.of(context).primaryColor,
//              color: Colors.green,
//              textColor: Colors.white,
//              onPressed: () {
//                setTimeShowNotification(oneNotify.index);
//              },
//              child: Text(
//                'Set time',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 20,
//                ),
//              ),
//            ),
//          ],
//        ),
//      ],
//    ),
//  );
//}
