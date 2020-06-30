import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

class AlarmBody extends StatelessWidget {
  final List<bool> _selectedDays;
  final int alarmId;
  final Function(int) _onDeleteAlarm;

  AlarmBody(this._selectedDays, this.alarmId, this._onDeleteAlarm);

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
                mode: DaySelector.modeFull,
                onChange: (value) {
                  if (DaySelector.monday & value == DaySelector.monday) {
                    _selectedDays[0] = true;
                  }
                  if (DaySelector.monday & value == 0) {
                    _selectedDays[0] = false;
                  }

                  if (DaySelector.tuesday & value == DaySelector.tuesday) {
                    _selectedDays[1] = true;
                  }
                  if (DaySelector.tuesday & value == 0) {
                    _selectedDays[1] = false;
                  }

                  if (DaySelector.wednesday & value == DaySelector.wednesday) {
                    _selectedDays[2] = true;
                  }
                  if (DaySelector.wednesday & value == 0) {
                    _selectedDays[2] = false;
                  }

                  if (DaySelector.thursday & value == DaySelector.thursday) {
                    _selectedDays[3] = true;
                  }
                  if (DaySelector.thursday & value == 0) {
                    _selectedDays[3] = false;
                  }

                  if (DaySelector.friday & value == DaySelector.friday) {
                    _selectedDays[4] = true;
                  }
                  if (DaySelector.friday & value == 0) {
                    _selectedDays[4] = false;
                  }

                  if (DaySelector.saturday & value == DaySelector.saturday) {
                    _selectedDays[5] = true;
                  }
                  if (DaySelector.saturday & value == 0) {
                    _selectedDays[5] = false;
                  }

                  if (DaySelector.sunday & value == DaySelector.sunday) {
                    _selectedDays[6] = true;
                  }
                  if (DaySelector.sunday & value == 0) {
                    _selectedDays[6] = false;
                  }
                },
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
                      _onDeleteAlarm(alarmId);
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
                    onPressed: () {},
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
//              _selectedDays[0] = true;
//            }
//            if (DaySelector.monday & value == 0) {
//              _selectedDays[0] = false;
//            }
//
//            if (DaySelector.tuesday & value == DaySelector.tuesday) {
//              _selectedDays[1] = true;
//            }
//            if (DaySelector.tuesday & value == 0) {
//              _selectedDays[1] = false;
//            }
//
//            if (DaySelector.wednesday & value == DaySelector.wednesday) {
//              _selectedDays[2] = true;
//            }
//            if (DaySelector.wednesday & value == 0) {
//              _selectedDays[2] = false;
//            }
//
//            if (DaySelector.thursday & value == DaySelector.thursday) {
//              _selectedDays[3] = true;
//            }
//            if (DaySelector.thursday & value == 0) {
//              _selectedDays[3] = false;
//            }
//
//            if (DaySelector.friday & value == DaySelector.friday) {
//              _selectedDays[4] = true;
//            }
//            if (DaySelector.friday & value == 0) {
//              _selectedDays[4] = false;
//            }
//
//            if (DaySelector.saturday & value == DaySelector.saturday) {
//              _selectedDays[5] = true;
//            }
//            if (DaySelector.saturday & value == 0) {
//              _selectedDays[5] = false;
//            }
//
//            if (DaySelector.sunday & value == DaySelector.sunday) {
//              _selectedDays[6] = true;
//            }
//            if (DaySelector.sunday & value == 0) {
//              _selectedDays[6] = false;
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
