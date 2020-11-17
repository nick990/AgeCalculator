import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final Color titleColor = Colors.white;
  static final Color color1 = Color.fromARGB(255, 76, 95, 215);
  static final Color color2 = Color.fromARGB(255, 114, 50, 189);
  static final Color color3 = Color.fromARGB(255, 255, 220, 125);
  static final Color color4 = Color.fromARGB(255, 244, 111, 48);
  static final Color color5 = Color.fromARGB(255, 215, 58, 73);

  static final gradient1 = LinearGradient(
    colors: <Color>[
      color2,
      color2,
      color1,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final gradient2 = LinearGradient(
    colors: <Color>[
      color4,
      color4,
      color3,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final gradient3 = LinearGradient(
    colors: <Color>[
      color4,
      color4,
      color5,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final appBarTextStyle = TextStyle(
    color: titleColor,
    fontSize: 25.0,
  );

  // static final Color appBarBackgroundColor = color1;

  static final cardTitleDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color1,
        color2,
      ],
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    primaryColor: color1,
    colorScheme: ColorScheme.light(primary: color1),
    cardTheme: CardTheme(
      margin: EdgeInsets.all(15),
      elevation: 10,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: titleColor,
      selectedItemColor: color1,
      unselectedItemColor: Colors.black54,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: color1,
      foregroundColor: Colors.white,
      elevation: 20,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(),
    ).apply(
        // displayColor: Colors.white,
        ),
  );

  static final textInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.black54,
        width: 2,
      )
      //borderSide: BorderSide(width: 2, color: AppTheme.color4),
      );

  static final double floatingButtonSize = 65;
  static final double floatinButtonIconSize = 40;
  static final double floatingButtonElevation = 20;
}
