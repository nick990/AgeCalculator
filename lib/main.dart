import 'package:age_calculator/pages/home.dart';
import 'package:age_calculator/pages/settings_partial_screen.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => SettingsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Age Calculator',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColorDark: Colors.deepOrangeAccent,
          cardTheme: CardTheme(
            elevation: 10,
            margin: EdgeInsets.all(10),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          "/settings": (context) => SettingsPartialScreen(),
        },
      ),
    );
  }
}
