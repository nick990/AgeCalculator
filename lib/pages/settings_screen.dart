import 'package:age_calculator/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPartialScreen extends StatefulWidget {
  @override
  _SettingsPartialScreenState createState() => _SettingsPartialScreenState();
}

class _SettingsPartialScreenState extends State<SettingsPartialScreen> {
  String format;
  @override
  void initState() {
    super.initState();
    this.format = Provider.of<SettingsProvider>(context, listen: false).format;
  }

  void _radioChanged(String format) {
    setState(() {
      this.format = format;
    });
    Provider.of<SettingsProvider>(context, listen: false).format = format;
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Date Format',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...settingsProvider.availableFormats
                        .asMap()
                        .entries
                        .map((entry) {
                      String format = entry.value;
                      return Container(
                          child: Row(
                        children: [
                          Radio(
                            activeColor: Theme.of(context).primaryColorDark,
                            groupValue: this.format,
                            onChanged: (format) => _radioChanged(format),
                            value: format,
                          ),
                          Text(
                            format,
                          ),
                        ],
                      ));
                    }).toList(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
