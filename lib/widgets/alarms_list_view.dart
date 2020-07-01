import 'package:alarm/models/lib.dart';
import 'package:flutter/material.dart';
import 'lib.dart';

class AlarmsListView extends StatefulWidget {
  final List<Alarm> _alarms;
  final Function(int, bool) _onAlarmExpand;
  final Function(int) _onDeleteAlarm;
  final Function(int, List<bool>) _onSetTimeAlarm;

  AlarmsListView(this._alarms, this._onAlarmExpand, this._onDeleteAlarm,
      this._onSetTimeAlarm);

  @override
  _AlarmsListViewState createState() => _AlarmsListViewState();
}

class _AlarmsListViewState extends State<AlarmsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(0.5),
      child: Theme(
        data: Theme.of(context)
            .copyWith(cardColor: Colors.yellow.withOpacity(0.6)),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              key: Key(widget._alarms.length.toString()),
              expansionCallback: (int panelIndex, bool isExpanded) =>
                  widget._onAlarmExpand(panelIndex, isExpanded),
              children: widget._alarms
                  .map<ExpansionPanel>((Alarm alarm) => ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) =>
                                AlarmHeader(alarm.time),
                        body: AlarmBody(alarm.selectedDays, alarm.id,
                            widget._onDeleteAlarm, widget._onSetTimeAlarm),
                        isExpanded: alarm.isExpanded,
                        canTapOnHeader: true,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
