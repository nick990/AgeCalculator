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

  String get format {
    return _format;
  }

  void set format(String newValue) {
    _format = newValue;
    notifyListeners();
  }
}
