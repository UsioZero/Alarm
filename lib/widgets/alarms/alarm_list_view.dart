import 'package:alarm/notifications/simple_notification.dart';
import 'package:flutter/material.dart';
import 'build_alarm_body.dart';
import 'build_alarm_header.dart';

Widget alarmListView(
    BuildContext context,
    List<SimpleNotification> simpleNotifications,
    setTimeShowNotification(int i),
    onDeleteBtnPressed(SimpleNotification notification),
    expansionCallback(int i, bool isExpanded),
    onHeaderTap(SimpleNotification oneNotify)) {
  return Container(
    color: Colors.yellow.withOpacity(0.5),
    child: Theme(
      data:
          Theme.of(context).copyWith(cardColor: Colors.yellow.withOpacity(0.6)),
      child: ListView(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int i, bool isExpanded) =>
                expansionCallback(i, isExpanded),
            children: simpleNotifications
                .map<ExpansionPanel>((SimpleNotification oneNotify) =>
                    ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) =>
                                buildAlarmHeader(oneNotify, onHeaderTap),
                        body: buildAlarmBody(
                            oneNotify,
                            context,
                            simpleNotifications,
                            setTimeShowNotification,
                            onDeleteBtnPressed),
                        isExpanded: oneNotify.isExpanded,
                        canTapOnHeader: true))
                .toList(),
          ),
        ],
      ),
    ),
  );
}
