import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

class AlarmBody extends StatefulWidget {
  final int alarmId;
  final Function(int) onAlarmDelete;
  final Function(int, List<bool>) onSetTime;

  AlarmBody(this.alarmId, this.onAlarmDelete, this.onSetTime);

  @override
  _AlarmBodyState createState() => _AlarmBodyState();
}

class _AlarmBodyState extends State<AlarmBody> {
  List<bool> selectedDays = [false, false, false, false, false, false, false];

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
                    selectedDays[0] = true;
                  }
                  if (DaySelector.monday & value == 0) {
                    selectedDays[0] = false;
                  }

                  if (DaySelector.tuesday & value == DaySelector.tuesday) {
                    selectedDays[1] = true;
                  }
                  if (DaySelector.tuesday & value == 0) {
                    selectedDays[1] = false;
                  }

                  if (DaySelector.wednesday & value == DaySelector.wednesday) {
                    selectedDays[2] = true;
                  }
                  if (DaySelector.wednesday & value == 0) {
                    selectedDays[2] = false;
                  }

                  if (DaySelector.thursday & value == DaySelector.thursday) {
                    selectedDays[3] = true;
                  }
                  if (DaySelector.thursday & value == 0) {
                    selectedDays[3] = false;
                  }

                  if (DaySelector.friday & value == DaySelector.friday) {
                    selectedDays[4] = true;
                  }
                  if (DaySelector.friday & value == 0) {
                    selectedDays[4] = false;
                  }

                  if (DaySelector.saturday & value == DaySelector.saturday) {
                    selectedDays[5] = true;
                  }
                  if (DaySelector.saturday & value == 0) {
                    selectedDays[5] = false;
                  }

                  if (DaySelector.sunday & value == DaySelector.sunday) {
                    selectedDays[6] = true;
                  }
                  if (DaySelector.sunday & value == 0) {
                    selectedDays[6] = false;
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
                      widget.onSetTime(widget.alarmId, selectedDays);
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
