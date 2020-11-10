import 'package:age_calculator/models/MyDate.dart';
import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyDateWidget extends StatelessWidget {
  final MyDate myDate;
  final DateFormat formatter;

  const MyDateWidget({Key key, this.myDate, this.formatter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(this.myDate.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<MyDatesProvider>(context, listen: false)
            .remove(this.myDate.id);
      },
      background: Container(
        color: Colors.white,
        child: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
      ),
    );
  }
}
