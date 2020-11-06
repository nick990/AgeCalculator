import 'package:age_calculator/models/MyDate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateWidget extends StatelessWidget {
  final MyDate myDate;
  final DateFormat formatter;

  const MyDateWidget({Key key, this.myDate, this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            '${myDate.name}',
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${this.myDate.age.years} Years Old"),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Birthday: ${this.formatter.format(myDate.birthday)}"),
              Text("Next Birthday: ${this.myDate.age.daysToNextBD} days"),
            ],
          ),
        ),
      ),
    );
  }
}
