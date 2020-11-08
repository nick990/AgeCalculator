import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/age.dart';
import 'package:age_calculator/widgets/lifetime.dart';
import 'package:age_calculator/widgets/next_birthday.dart';
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
  final birthdayController = TextEditingController();
  final todayController = TextEditingController();
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

  _setBirthdayController(DateFormat formatter) {
    if (birthdayDate != null)
      birthdayController.text = "${formatter.format(birthdayDate)}";
  }

  _setTodayController(DateFormat formatter) {
    todayController.text = "${formatter.format(todayDate)}";
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final formatter = DateFormat(settingsProvider.format);
    _setTodayController(formatter);
    _setBirthdayController(formatter);

    var birthdaySelector = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectBirthdayDate(context),
                  child: TextField(
                    style: Theme.of(context).textTheme.headline4,
                    decoration: InputDecoration(
                      labelText: 'Birthday',
                      border: const OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    controller: birthdayController,
                    enabled: false,
                    onSubmitted: (_) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    var todaySection = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                    labelText: 'Today',
                    border: const OutlineInputBorder(),
                  ),
                  controller: todayController,
                  enabled: false,
                  onSubmitted: (_) {},
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
          todaySection,
          Divider(),
          birthdaySelector,
        ],
      ),
    );

    final List<Widget> ageSection = new List<Widget>();
    if (this.age != null) {
      ageSection.add(AgeWidget(age: age));
      ageSection.add(LifetimeWidget(lifetime: lifeTime));
      ageSection.add(NextBirthdayWidget(age: age));
      ageSection
          .add(UpcomingBirthdaysWidget(age: this.age, formatter: formatter));
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
