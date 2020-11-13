import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/widgets/mydate.dart';
import 'package:age_calculator/widgets/mydate_creation.dart';
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
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                bottom: 50,
                top: 10,
              ),
              itemBuilder: (_, i) => MyDateWidget(
                myDate: myDatesProvider.myDates[i],
                formatter: DateFormat(settingsProvider.format),
              ),
              itemCount: myDatesProvider.myDates.length,
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColorDark,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return MyDateCreationModal(
                    formatter: DateFormat(settingsProvider.format),
                  );
                });
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
