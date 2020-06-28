import 'package:flutter/material.dart';

class AlarmHeader extends StatelessWidget {

  final TimeOfDay _time;

  AlarmHeader(this._time);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Container(
        child: Icon(
          Icons.alarm,
          color: Colors.black,
        ),
        padding: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1, color: Colors.black))),
      ),
      title: Text(
        _time.format(context),
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }

}
