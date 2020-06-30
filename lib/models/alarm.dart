import 'package:flutter/material.dart';

class Alarm {
  final int id;
  final int notificationId;
  TimeOfDay time;
  List<bool> selectedDays = new List(7);
  bool isExpanded = false;

  Alarm(this.id, this.notificationId, this.time, this.selectedDays);
}
