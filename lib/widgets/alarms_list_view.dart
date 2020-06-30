import 'package:alarm/models/lib.dart';
import 'package:flutter/material.dart';
import 'lib.dart';

class AlarmsListView extends StatelessWidget {
  final List<Alarm> _alarms;
  final Function(int, bool) _onAlarmExpand;
  final Function(int) _onDeleteAlarm;
  final Function(int, List<bool>) _onSetTimeAlarm;

  AlarmsListView(this._alarms, this._onAlarmExpand, this._onDeleteAlarm,
      this._onSetTimeAlarm);

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
                _onAlarmExpand(_alarms[panelIndex].id, isExpanded),
              },
              children: _alarms
                  .map<ExpansionPanel>((Alarm alarm) => ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) =>
                                AlarmHeader(alarm.time),
                        body: AlarmBody(alarm.selectedDays, alarm.id,
                            _onDeleteAlarm, _onSetTimeAlarm),
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
