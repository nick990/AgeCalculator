import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/lifetime.dart';
import 'package:age_calculator/widgets/mycard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

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
  //String format;
  //DateFormat formatter;

  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  //List<TableRow> _nextBirthdaysList;

  @override
  void initState() {
    birthdayDate = null;
    var now = DateTime.now();
    todayDate = new DateTime(now.year, now.month, now.day);
    age = null;
    lifeTime = null;
    // format = 'dd-MM-yyyy';
    // formatter = DateFormat(format);
    // _createNextBirthdaysList();
  }

  // void _createNextBirthdaysList() {
  //   _nextBirthdaysList = List<TableRow>();
  //   List<DateTime> birthdays;
  //   if (age != null) {
  //     birthdays = age.getNextBirthdaysList();
  //     for (int i = 0; i < birthdays.length; i++) {
  //       _nextBirthdaysList.add(
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text(
  //                   "${formatter.format(birthdays[i])} \t",
  //                   textAlign: TextAlign.end,
  //                 ),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text(
  //                   "${daysOfWeek[birthdays[i].weekday - 1]}",
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final format = settingsProvider.format;
    final formatter = DateFormat(format);
    //_createNextBirthdaysList();

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
              Text(
                birthdayDate != null
                    ? "${formatter.format(birthdayDate)}"
                    : " ---",
                style: Theme.of(context).textTheme.headline3,
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
                    Text(
                      "${formatter.format(todayDate)}",
                      style: Theme.of(context).textTheme.headline3,
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

    var ageSection = MyCard(
      title: 'Age',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                this.age != null ? age.years.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Years'),
            ],
          ),
          Column(
            children: [
              Text(
                this.age != null ? age.months.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Months'),
            ],
          ),
          Column(
            children: [
              Text(
                this.age != null ? age.days.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Days'),
            ],
          ),
        ],
      ),
    );

    // var upcomingBirthdaysSection = MyCard(
    //   title: 'Upcoming Birthdays',
    //   body: Table(
    //     children: _nextBirthdaysList,
    //   ),
    // );

    var nextBirthdaySection = MyCard(
      title: 'Next Birthdays',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                this.age != null ? age.daysToNextBD.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Days'),
            ],
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              datesSection,
              ageSection,
              LifetimeWidget(
                lifetime: lifeTime,
              ),
              nextBirthdaySection,
              //  upcomingBirthdaysSection,
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
        this.age = AgeModel(birthday: birthdayDate, today: todayDate);
        this.lifeTime = LifeTime(age);
        //this._createNextBirthdaysList();
      });
  }

  // _menuSelect(BuildContext context, RoutePopupMenuItem choice) async {
  //   if (choice.title == 'Date Format') {
  //     print('Date Format');
  //     //var formatSelected = await Navigator.pushNamed(context, choice.route);
  //     var formatSelected = await Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 FormatChoiceScreen(selectedFormat: format)));
  //     setState(() {
  //       this.format = formatSelected;
  //       formatter = DateFormat(format);
  //       this._createNextBirthdaysList();
  //     });
  //   }
  //   if (choice.title == 'Share') {
  //     _share(context);
  //   }
  // }

  // _share(BuildContext context) {
  //   final RenderBox box = context.findRenderObject();
  //   String message =
  //       "https://play.google.com/store/apps/details?id=com.festa.age_calculator";
  //   if (lifeTime != null) {
  //     message = "I'm ${lifeTime.days} days old.\n" +
  //         "My next birthday is in ${age.daysToNextBD} days.\n\n" +
  //         message;
  //   }
  //   Share.share(message,
  //       subject: 'Age Calculator',
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
}
