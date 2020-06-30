// LIBRARIES
import 'package:flutter/material.dart';

class AlarmAlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Alarm')),
        body: Container(
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Back'),
              onPressed: () {
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        ));
  }
}
