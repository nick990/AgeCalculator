import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/age.dart';
import 'package:age_calculator/widgets/lifetime.dart';
import 'package:age_calculator/widgets/next_birthdays.dart';
import 'package:age_calculator/widgets/upcoming_birthdays.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalculatorPartialScreen extends StatefulWidget {
  @override
  _CalculatorPartialScreenState createState() =>
      _CalculatorPartialScreenState();
}

class _CalculatorPartialScreenState extends State<CalculatorPartialScreen> {
  DateTime birthdayDate;
  DateTime todayDate;
  AgeModel age;
  LifeTime lifeTime;

  @override
  void initState() {
    birthdayDate = null;
    var now = DateTime.now();
    todayDate = new DateTime(now.year, now.month, now.day);
    age = null;
    lifeTime = null;
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    final format = settingsProvider.format;
    final formatter = DateFormat(format);

    var birthdaySelector = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birthday',
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<SettingsProvider>(
                builder: (ctx, settings, child) => Text(
                  birthdayDate != null
                      // ? "${formatter.format(birthdayDate)}"
                      ? "${DateFormat(settings.format).format(birthdayDate)}"
                      : " ---",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              CircleAvatar(
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _selectBirthdayDate(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    var datesSection = Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<SettingsProvider>(
                      builder: (ctx, settings, child) => Text(
                        // "${formatter.format(todayDate)}",
                        "${DateFormat(settings.format).format(todayDate)}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          birthdaySelector,
        ],
      ),
    );

    final List<Widget> ageSection = new List<Widget>();
    if (this.age != null) {
      ageSection.add(AgeWidget(age: age));
      ageSection.add(LifetimeWidget(lifetime: lifeTime));
      ageSection.add(NextBirthdaysWidget(age: age));
      ageSection.add(
        Consumer<SettingsProvider>(
          builder: (ctx, settings, child) => UpcomingBirthdaysWidget(
            age: this.age,
            formatter: DateFormat(settings.format),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              datesSection,
              ...ageSection,
            ],
          ),
        ),
      ),
    );
  }

  _selectBirthdayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate:
            birthdayDate != null ? birthdayDate : todayDate, // Refer step 1
        firstDate: DateTime(1900),
        lastDate: this.todayDate,
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select birthday date',
        fieldLabelText: 'Birthday date');
    if (picked != null && picked != birthdayDate)
      setState(() {
        birthdayDate = picked;
        this.age = AgeModel.today(birthday: birthdayDate);
        this.lifeTime = LifeTime(age);
      });
  }
}
