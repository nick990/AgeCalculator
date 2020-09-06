import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/pages/format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoutePopupMenuItem {
  RoutePopupMenuItem({this.title, this.icon, this.route});
  String title;
  IconData icon;
  String route;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime birthdayDate;
  DateTime todayDate;
  AgeModel age;
  LifeTime lifeTime;
  String format;
  DateFormat formatter;

  List<RoutePopupMenuItem> menuChoices = [
    RoutePopupMenuItem(
        title: 'Date Format', route: '/date_format', icon: Icons.date_range),
    RoutePopupMenuItem(
        title: 'Share', route: '/date_format', icon: Icons.share),
  ];

  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  List<TableRow> _nextBirthdaysList;

  @override
  void initState() {
    birthdayDate = null;
    todayDate = DateTime.now();
    age = null;
    lifeTime = null;
    format = 'dd-MM-yyyy';
    formatter = DateFormat(format);
    _createNextBirthdaysList();
  }

  void _createNextBirthdaysList() {
    _nextBirthdaysList = List<TableRow>();
    List<DateTime> birthdays;
    if (age != null) {
      birthdays = age.getNextBirthdaysList();
      for (int i = 0; i < birthdays.length; i++) {
        _nextBirthdaysList.add(
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "${formatter.format(birthdays[i])} \t",
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
  }

  @override
  Widget build(BuildContext context) {
    var birthdaySelector = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birthday',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                birthdayDate != null
                    //? "${birthdayDate.toLocal()}".split(' ')[0]
                    ? "${formatter.format(birthdayDate)}"
                    : " ---",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.white,
                  onPressed: () => _selectBirthdayDate(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    var datesSection = Card(
      elevation: 3,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //"${todayDate.toLocal()}".split(' ')[0],
                      "${formatter.format(todayDate)}",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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

    var ageSection = Card(
      elevation: 3,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        this.age != null ? age.years.toString() : '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text('Years'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        this.age != null ? age.months.toString() : '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text('Months'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        this.age != null ? age.days.toString() : '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text('Days'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ],
      ),
    );

    var menu = PopupMenuButton<RoutePopupMenuItem>(
      onSelected: (choice) {
        _menuSelect(context, choice);
      },
      itemBuilder: (BuildContext context) {
        return menuChoices.map((RoutePopupMenuItem item) {
          return PopupMenuItem(
              value: item,
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    color: Colors.grey,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text(item.title),
                ],
              ));
        }).toList();
      },
    );

    var lifetimeSection = Card(
      elevation: 3,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Lifetime',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Years \t',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            this.lifeTime != null
                                ? lifeTime.years.toString()
                                : '-',
                          ),
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Months \t',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            this.lifeTime != null
                                ? lifeTime.months.toString()
                                : '-',
                          ),
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "Days  \t",
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            this.lifeTime != null
                                ? lifeTime.days.toString()
                                : '-',
                          ),
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Seconds \t',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            this.lifeTime != null
                                ? lifeTime.seconds.toString()
                                : '-',
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ],
      ),
    );

    var nextBirthdaysSection = Card(
      elevation: 3,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Next Birthdays',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Table(
                children: _nextBirthdaysList,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Age Calculator'),
        actions: [
          menu,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                datesSection,
                Padding(padding: EdgeInsets.all(4.0)),
                ageSection,
                Padding(padding: EdgeInsets.all(4.0)),
                lifetimeSection,
                Padding(padding: EdgeInsets.all(4.0)),
                nextBirthdaysSection,
              ],
            ),
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
        this.age = AgeModel(startDate: birthdayDate, endDate: todayDate);
        this.lifeTime = LifeTime(age);
        this._createNextBirthdaysList();
      });
  }

  _menuSelect(BuildContext context, RoutePopupMenuItem choice) async {
    if (choice.title == 'Date Format') {
      print('Date Format');
      //var formatSelected = await Navigator.pushNamed(context, choice.route);
      var formatSelected = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Format(selectedFormat: format)));
      setState(() {
        this.format = formatSelected;
        formatter = DateFormat(format);
        this._createNextBirthdaysList();
      });
    }
  }
}
