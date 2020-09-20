import 'package:age_calculator/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
