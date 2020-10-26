class AgeModel {
  int years;
  int months;
  int days;
  DateTime birthday; //birthday
  DateTime today; //today
  int daysToNextBD;

  AgeModel({this.birthday, this.today}) {
    this.init(birthday, today);
  }

  AgeModel.today({this.birthday}) {
    final now = DateTime.now();
    final todayDate = new DateTime(now.year, now.month, now.day);
    this.init(birthday, todayDate);
  }

  init(DateTime birthday, DateTime today) {
    this.today = today;
    this.birthday = birthday;
    print("Today: ${today}");
    print("Birthday: ${birthday}");
    DateTime lastBirthday = getLastBirthday();
    print("Last birthday: ${lastBirthday.toString()}");
    this.years = today.year - birthday.year;
    //Se l'ultimo compleanno non è nell'anno corrente
    if (lastBirthday.year < today.year) {
      this.years--;
      this.months = today.month + (12 - lastBirthday.month);
    } else {
      this.months = today.month - lastBirthday.month;
    }
    if (lastBirthday.month != birthday.month) {
      this.months++;
    }
    if (birthday.day > today.day) {
      this.months--;
    }
    var lastAnn = getLastMonthAnniversary();
    print("Last month anniversay: ${lastAnn.toString()}");
    this.days = today.difference(lastAnn).inDays;
    if (lastAnn.day != birthday.day) {
      this.days++;
    }

    DateTime nextBirthday = getNextBirthday();
    print("Next birthday: ${nextBirthday}");
    this.daysToNextBD = nextBirthday.difference(today).inDays;
  }

  DateTime getNextBirthday() {
    var currentYearBirthday =
        DateTime(today.year, birthday.month, birthday.day);
    if (currentYearBirthday.isAfter(today)) {
      return currentYearBirthday;
    } else {
      return DateTime(today.year + 1, birthday.month, birthday.day);
    }
  }

  DateTime getLastBirthday() {
    var currentYearBirthday =
        DateTime(today.year, birthday.month, birthday.day);

    if (currentYearBirthday.isBefore(today) ||
        currentYearBirthday.isAtSameMomentAs(today)) {
      return currentYearBirthday;
    } else {
      return DateTime(today.year - 1, birthday.month, birthday.day);
    }
  }

  DateTime getLastMonthAnniversary() {
    int year = today.year;
    int month = today.month;
    if (today.day < birthday.day) {
      month = today.month > 1 ? today.month - 1 : 1;
      if (month == 1) {
        year--;
      }
    }

    int day = birthday.day;
    return DateTime(year, month, day);
  }

  List<DateTime> getNextBirthdaysList() {
    var list = List<DateTime>();
    var startingYear;
    DateTime lastBirthday = getLastBirthday();
    if (lastBirthday.year < today.year) {
      startingYear = today.year;
    } else {
      startingYear = today.year + 1;
    }
    for (int i = 0; i < 10; i++) {
      list.add(DateTime(startingYear + i, birthday.month, birthday.day));
    }
    return list;
  }
}
