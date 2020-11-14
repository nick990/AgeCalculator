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

  Future<int> add(MyDate newDate) async {
    var res = await MyDatesSqlRepository.instance.insert(newDate);
    _fetch();
    return res;
  }

  void update(MyDate myDate) async {
    await MyDatesSqlRepository.instance.update(myDate);
    _fetch();
  }

  void remove(int id) async {
    await MyDatesSqlRepository.instance.delete(id);
    _fetch();
  }
}
