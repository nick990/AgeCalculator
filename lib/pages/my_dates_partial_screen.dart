import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/mydate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyDatesPartialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myDatesProvider = Provider.of<MyDatesProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (_, i) => MyDateWidget(
            myDate: myDatesProvider.myDates[i],
            formatter: DateFormat(settingsProvider.format),
          ),
          itemCount: myDatesProvider.myDates.length,
        ),
      ),
    );
  }
}
