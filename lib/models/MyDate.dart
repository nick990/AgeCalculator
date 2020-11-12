import 'package:flutter/material.dart';

import 'Age.dart';

class MyDate {
  int id;
  String name;
  DateTime birthday;
  AgeModel age;

  MyDate({@required this.name, @required this.birthday, this.id}) {
    this.age = AgeModel.today(birthday: this.birthday);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthday': (birthday.toUtc().millisecondsSinceEpoch / 1000).round()
    };
  }

  Update(String name, DateTime birthday) {
    this.name = name;
    this.birthday = birthday;
    this.age = AgeModel.today(birthday: this.birthday);
  }
}
