import 'package:age_calculator/models/MyDate.dart';
import 'package:age_calculator/pages/my_date_details_screen.dart';
import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:age_calculator/themes/app_theme.dart';
import 'package:age_calculator/widgets/gradient_icon.dart';
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
        child: GradientIcon(
          icon: Icons.delete,
          size: 40,
          gradient: AppTheme.gradient3,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              MyDateDetailsScreen.routeName,
              arguments: this.myDate,
            );
          },
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
      ),
    );
  }
}
