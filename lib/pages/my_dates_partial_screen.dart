import 'package:age_calculator/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDatesPartialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final format = settingsProvider.format;
    return Scaffold(
      body: SingleChildScrollView(
        child: Text('My Dates\n$format'),
      ),
    );
  }
}
