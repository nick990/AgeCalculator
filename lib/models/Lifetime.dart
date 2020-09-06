import 'package:age_calculator/models/Age.dart';

class LifeTime {
  int years;
  int months;
  int days;
  int seconds;
  LifeTime(AgeModel age) {
    this.years = age.years;
    this.months = this.years * 12 + age.months;
    this.days = age.endDate.difference(age.startDate).inDays;
    this.seconds = age.endDate.difference(age.startDate).inSeconds;
  }
}
