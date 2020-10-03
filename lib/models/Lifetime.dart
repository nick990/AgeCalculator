import 'package:age_calculator/models/Age.dart';

class LifeTime {
  int years;
  int months;
  int days;
  int hours;
  int seconds;
  int minutes;

  LifeTime(AgeModel age) {
    this.years = age.years;
    this.months = this.years * 12 + age.months;
    this.days = age.today.difference(age.birthday).inDays;
    this.seconds = age.today.difference(age.birthday).inSeconds;
    this.hours = age.today.difference(age.birthday).inHours;
    this.minutes = age.today.difference(age.birthday).inMinutes;
  }
}
