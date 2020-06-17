import 'package:flutter/material.dart';
import 'Allarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Timer',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
        ),
      home: Allarm(),
    );  }

}

