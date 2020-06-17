import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: Container(
        child: Center(
          child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Back'),
              onPressed: (){Navigator.pop(context);},
            ),
        ),
      )
    );
  }
  
}