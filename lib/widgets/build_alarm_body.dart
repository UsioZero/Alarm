import 'package:alarm/notifications/notifications.dart';
import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

Widget buildAlarmBody(
    SimpleNotification oneNotify,
    BuildContext context,
    List simpleNotifications,
    setTimeShowNotification(int i),
    onDeleteBtnPressed(SimpleNotification notification)) {
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
            if (DaySelector.monday & value == DaySelector.monday) {
              oneNotify.daySel[0] = true;
            }
            if (DaySelector.monday & value == 0) {
              oneNotify.daySel[0] = false;
            }

            if (DaySelector.tuesday & value == DaySelector.tuesday) {
              oneNotify.daySel[1] = true;
            }
            if (DaySelector.tuesday & value == 0) {
              oneNotify.daySel[1] = false;
            }

            if (DaySelector.wednesday & value == DaySelector.wednesday) {
              oneNotify.daySel[2] = true;
            }
            if (DaySelector.wednesday & value == 0) {
              oneNotify.daySel[2] = false;
            }

            if (DaySelector.thursday & value == DaySelector.thursday) {
              oneNotify.daySel[3] = true;
            }
            if (DaySelector.thursday & value == 0) {
              oneNotify.daySel[3] = false;
            }

            if (DaySelector.friday & value == DaySelector.friday) {
              oneNotify.daySel[4] = true;
            }
            if (DaySelector.friday & value == 0) {
              oneNotify.daySel[4] = false;
            }

            if (DaySelector.saturday & value == DaySelector.saturday) {
              oneNotify.daySel[5] = true;
            }
            if (DaySelector.saturday & value == 0) {
              oneNotify.daySel[5] = false;
            }

            if (DaySelector.sunday & value == DaySelector.sunday) {
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
              onPressed: () => onDeleteBtnPressed(oneNotify),
            ),
            RaisedButton(
              splashColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).primaryColor,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                setTimeShowNotification(oneNotify.index);
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
