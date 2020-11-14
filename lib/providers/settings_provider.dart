import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  List<String> _formatList = [
    "dd-MM-yyyy",
    "yyyy-MM-dd",
    "MM-dd-yyyy",
  ];

  List<String> get availableFormats {
    return _formatList;
  }

  String _format = "dd-MM-yyyy";
  DateTime _birthday;

  String get format {
    return _format;
  }

  set format(String newValue) {
    _format = newValue;
    notifyListeners();
  }

  DateTime get birthday {
    return _birthday;
  }

  set birthday(DateTime birthday) {
    _birthday = birthday;
    notifyListeners();
  }
}
