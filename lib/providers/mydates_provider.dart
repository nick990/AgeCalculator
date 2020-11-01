import 'package:age_calculator/models/MyDate.dart';
import 'package:flutter/material.dart';

class MyDatesProvider with ChangeNotifier {
  List<MyDate> _myDates = [
    MyDate(
      name: 'Nicolò',
      birthday: new DateTime.utc(1990, DateTime.october, 21),
    ),
    MyDate(
      name: 'Diego',
      birthday: new DateTime.utc(1992, DateTime.june, 8),
    ),
    MyDate(
      name: 'Niky',
      birthday: new DateTime.utc(1962, DateTime.june, 24),
    ),
    MyDate(
      name: 'Beppe',
      birthday: new DateTime.utc(1954, DateTime.july, 3),
    ),
  ];

  List<MyDate> get myDates {
    return [..._myDates];
  }
}
