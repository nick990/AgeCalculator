import 'package:flutter/material.dart';

import 'Age.dart';

class MyDate {
  final String name;
  final DateTime birthday;
  AgeModel age;

  MyDate({
    @required this.name,
    @required this.birthday,
  }) {
    this.age = AgeModel.today(birthday: this.birthday);
  }
}
