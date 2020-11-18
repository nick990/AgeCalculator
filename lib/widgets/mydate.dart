import 'package:age_calculator/models/MyDate.dart';
import 'package:age_calculator/pages/my_date_details_screen.dart';
import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:age_calculator/themes/app_theme.dart';
import 'package:age_calculator/widgets/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
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
        decoration: BoxDecoration(
          gradient: AppTheme.gradient4,
        ),
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
          child: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.gradient1,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  '${myDate.name}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                      ),
                ),
                trailing: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${this.myDate.age.years}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        "Years Old",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Birthday: ${this.formatter.format(myDate.birthday)}",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      "Next Birthday: ${this.myDate.age.daysToNextBD} days",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
