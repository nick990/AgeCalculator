import 'package:age_calculator/models/MyDate.dart';
import 'package:flutter/material.dart';

class MyDatesProvider with ChangeNotifier {
  List<MyDate> _myDates = [];

  List<MyDate> get myDates {
    return _myDates;
  }
}
