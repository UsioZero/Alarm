import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

class AlarmBody extends StatelessWidget {

  final List<int> _selectedDays;

  AlarmBody(this._selectedDays);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DaySelector()
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
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    splashColor: Theme
                        .of(context)
                        .primaryColor,
                    highlightColor: Theme
                        .of(context)
                        .primaryColor,
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
//              oneNotify.daySel['monday'] = true;
//            }
//            if (DaySelector.monday & value == 0) {
//              oneNotify.daySel['monday'] = false;
//            }
//
//            if (DaySelector.tuesday & value == DaySelector.tuesday) {
//              oneNotify.daySel['tuesday'] = true;
//            }
//            if (DaySelector.tuesday & value == 0) {
//              oneNotify.daySel['tuesday'] = false;
//            }
//
//            if (DaySelector.wednesday & value == DaySelector.wednesday) {
//              oneNotify.daySel['wednesday'] = true;
//            }
//            if (DaySelector.wednesday & value == 0) {
//              oneNotify.daySel['wednesday'] = false;
//            }
//
//            if (DaySelector.thursday & value == DaySelector.thursday) {
//              oneNotify.daySel['thurseday'] = true;
//            }
//            if (DaySelector.thursday & value == 0) {
//              oneNotify.daySel['thurseday'] = false;
//            }
//
//            if (DaySelector.friday & value == DaySelector.friday) {
//              oneNotify.daySel['friday'] = true;
//            }
//            if (DaySelector.friday & value == 0) {
//              oneNotify.daySel['friday'] = false;
//            }
//
//            if (DaySelector.saturday & value == DaySelector.saturday) {
//              oneNotify.daySel['saturday'] = true;
//            }
//            if (DaySelector.saturday & value == 0) {
//              oneNotify.daySel['saturday'] = false;
//            }
//
//            if (DaySelector.sunday & value == DaySelector.sunday) {
//              oneNotify.daySel['sunday'] = true;
//            }
//            if (DaySelector.sunday & value == 0) {
//              oneNotify.daySel['sunday'] = false;
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
