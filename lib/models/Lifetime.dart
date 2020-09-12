import 'package:age_calculator/models/Age.dart';

class LifeTime {
  int years;
  int months;
  int days;
  int seconds;
  LifeTime(AgeModel age) {
    this.years = age.years;
    this.months = this.years * 12 + age.months;
    this.days = age.today.difference(age.birthday).inDays;
    this.seconds = age.today.difference(age.birthday).inSeconds;
  }
}
