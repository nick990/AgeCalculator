import 'package:age_calculator/pages/home.dart';
import 'package:age_calculator/pages/my_date_details_screen.dart';
import 'package:age_calculator/pages/settings_screen.dart';
import 'package:age_calculator/providers/mydates_provider.dart';
import 'package:age_calculator/providers/settings_provider.dart';
import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyDatesProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Age Calculator',
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColorDark: Colors.deepOrangeAccent,
        //   scaffoldBackgroundColor: Colors.white24,
        //   cardTheme: CardTheme(
        //     elevation: 10,
        //     margin: EdgeInsets.all(10),
        //   ),
        // ),
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          "/settings": (context) => SettingsPartialScreen(),
          MyDateDetailsScreen.routeName: (context) => MyDateDetailsScreen(),
        },
      ),
    );
  }
}
