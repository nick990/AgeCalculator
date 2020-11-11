import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/age.dart';
import 'package:age_calculator/widgets/lifetime.dart';
import 'package:age_calculator/widgets/mycard.dart';
import 'package:age_calculator/widgets/next_birthday.dart';
import 'package:age_calculator/widgets/upcoming_birthdays.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/MyDate.dart';

class MyDateDetailsScreen extends StatelessWidget {
  static const routeName = '/myMateDetails';

  @override
  Widget build(BuildContext context) {
    final MyDate myDate = ModalRoute.of(context).settings.arguments;
    final LifeTime lifetime = LifeTime(myDate.age);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final formatter = DateFormat(settingsProvider.format);

    final List<Widget> ageSection = new List<Widget>();
    ageSection.add(AgeWidget(age: myDate.age));
    ageSection.add(LifetimeWidget(lifetime: lifetime));
    ageSection.add(NextBirthdayWidget(age: myDate.age));
    ageSection
        .add(UpcomingBirthdaysWidget(age: myDate.age, formatter: formatter));

    var birthdaySection = MyCard(
      title: 'Birthday',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            formatter.format(myDate.birthday),
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            myDate.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.edit), onPressed: () => {}),
            IconButton(icon: Icon(Icons.delete), onPressed: () => {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              birthdaySection,
              ...ageSection,
            ],
          ),
        ),
      ),
    );
  }
}
