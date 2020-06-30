import 'package:flutter/material.dart';

class Alarm {
  final int id;
  final int notificationId;
  TimeOfDay time;
  bool isExpanded = false;

  Alarm(this.id, this.notificationId, this.time);
}
