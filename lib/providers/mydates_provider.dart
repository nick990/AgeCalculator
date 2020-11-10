import 'package:age_calculator/models/MyDate.dart';
import 'package:age_calculator/repositories/mydates_sql_repository.dart';
import 'package:flutter/material.dart';

class MyDatesProvider with ChangeNotifier {
  List<MyDate> _myDates;

  MyDatesProvider() {
    _fetch();
  }

  _fetch() {
    _myDates = [];
    MyDatesSqlRepository.instance.queryAllRows().then((result) {
      result.forEach((row) {
        var myDate = MyDate(
            name: row['name'],
            birthday:
                DateTime.fromMillisecondsSinceEpoch(row['birthday'] * 1000));
        myDate.id = row['id'];
        _myDates.add(myDate);
      });
      notifyListeners();
    });
  }

  List<MyDate> get myDates {
    return [..._myDates];
  }

  void add(MyDate newDate) async {
    var id = await MyDatesSqlRepository.instance.insert(newDate);
    newDate.id = id;
    _fetch();
  }
}
