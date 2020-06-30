import 'package:alarm/models/lib.dart';
import 'package:flutter/material.dart';
import 'lib.dart';

class AlarmsListView extends StatefulWidget {
  final List<Alarm> _alarms;
  final Function(int, bool) _onAlarmExpand;
  final Function(int) _onAlarmDelete;
  final Function(int, List<bool>) _onSetTime;

  AlarmsListView(
      this._alarms, this._onAlarmExpand, this._onAlarmDelete, this._onSetTime);

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
              expansionCallback: (panelIndex, isExpanded) => {
                widget._onAlarmExpand(
                    widget._alarms[panelIndex].id, isExpanded),
              },
              children: widget._alarms.map<ExpansionPanel>((Alarm alarm) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      new AlarmHeader(alarm.time),
                  body: new AlarmBody(
                      alarm.id, widget._onAlarmDelete, widget._onSetTime),
                  isExpanded: alarm.isExpanded,
                  canTapOnHeader: true,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
