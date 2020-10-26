import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/widgets/mycard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingBirthdaysWidget extends StatelessWidget {
  final AgeModel age;
  final DateFormat formatter;

  UpcomingBirthdaysWidget({Key key, this.age, this.formatter})
      : super(key: key);

  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  @override
  Widget build(BuildContext context) {
    final _nextBirthdaysList = List<TableRow>();

    List<DateTime> birthdays;
    if (this.age != null) {
      birthdays = this.age.getNextBirthdaysList();
      for (int i = 0; i < birthdays.length; i++) {
        _nextBirthdaysList.add(
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "${this.formatter.format(birthdays[i])} \t",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "${daysOfWeek[birthdays[i].weekday - 1]}",
                  ),
                ),
              )
            ],
          ),
        );
      }
    }

    return MyCard(
      title: 'Upcoming Birthdays',
      body: Table(
        children: _nextBirthdaysList,
      ),
    );
  }
}
