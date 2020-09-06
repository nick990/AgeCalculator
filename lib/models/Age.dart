class AgeModel {
  int years;
  int months;
  int days;
  DateTime startDate; //birthday
  DateTime endDate; //today
  AgeModel({this.startDate, this.endDate}) {
    DateTime lastBirthday = getLastBirthday();
    print("Last birthday: ${lastBirthday.toString()}");
    this.years = endDate.year - startDate.year;
    //Se l'ultimo compleanno non è nell'anno corrente
    if (lastBirthday.year < endDate.year) {
      this.years--;
      this.months = endDate.month + (12 - lastBirthday.month);
    } else {
      this.months = endDate.month - lastBirthday.month;
    }
    if (lastBirthday.month != startDate.month) {
      this.months++;
    }
    if (startDate.day > endDate.day) {
      this.months--;
    }
    var lastAnn = getLastMonthAnniversary();
    print("Last month anniversay: ${lastAnn.toString()}");
    this.days = endDate.difference(lastAnn).inDays;
    if (lastAnn.day != startDate.day) {
      this.days++;
    }
  }

  DateTime getLastBirthday() {
    var currentYearBirthday =
        DateTime(endDate.year, startDate.month, startDate.day);

    if (currentYearBirthday.isBefore(endDate)) {
      return currentYearBirthday;
    } else {
      return DateTime(endDate.year - 1, startDate.month, startDate.day);
    }
  }

  DateTime getLastMonthAnniversary() {
    int year = endDate.year;
    int month = endDate.month;
    if (endDate.day < startDate.day) {
      month = endDate.month > 1 ? endDate.month - 1 : 1;
      if (month == 1) {
        year--;
      }
    }

    int day = startDate.day;
    return DateTime(year, month, day);
  }

  List<DateTime> getNextBirthdaysList() {
    var list = List<DateTime>();
    var startingYear;
    DateTime lastBirthday = getLastBirthday();
    if (lastBirthday.year < endDate.year) {
      startingYear = endDate.year;
    } else {
      startingYear = endDate.year + 1;
    }
    for (int i = 0; i < 10; i++) {
      list.add(DateTime(startingYear + i, startDate.month, startDate.day));
    }
    return list;
  }
}
