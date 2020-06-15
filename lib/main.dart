import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(Allarm());

class Allarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
          title: 'Clock',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Clock'),
              leading: Container(
               child: Icon(Icons.alarm, color: Colors.white70),
              padding: EdgeInsets.only(right: 5),               
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
              showOverlayNotification((context) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: SafeArea(
                      child: ListTile(
                        leading: SizedBox.fromSize(
                          size: const Size(40, 40),
                          child: ClipOval(
                            child: Container(
                              color: Colors.yellow,
                            )
                          )
                        ),
                        title: Text('Timer is ready'),
                        trailing: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                             OverlaySupportEntry.of(context).dismiss();
                          }
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Icon(Icons.add_alarm),
            )
          )
      )
    );
  }
}
