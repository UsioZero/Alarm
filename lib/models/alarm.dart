import 'package:flutter/material.dart';

class Alarm {
  int id;
  TimeOfDay time;
  List<int> selectedDays;
  bool isExpanded = false;

  Alarm(this.id, this.time, this.selectedDays);
}