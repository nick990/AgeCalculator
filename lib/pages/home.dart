import 'package:age_calculator/hour_glass_icons.dart';
import 'package:age_calculator/pages/calculator_partial_screen.dart';
import 'package:age_calculator/pages/my_dates_partial_screen.dart';
import 'package:age_calculator/themes/app_theme.dart';
import 'package:age_calculator/widgets/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class RoutePopupMenuItem {
  RoutePopupMenuItem({this.title, this.icon, this.route});
  String title;
  IconData icon;
  String route;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CalculatorPartialScreen(),
      'title': 'Age Calculator',
      'icon': HourGlass.hourglass,
      'icon_text': 'Calculator',
    },
    {
      'page': MyDatesPartialScreen(),
      'title': 'My Dates',
      'icon': Icons.people,
      'icon_text': 'My Dates',
    },
  ];

  final List<RoutePopupMenuItem> menuChoices = [
    RoutePopupMenuItem(
      title: 'Settings',
      route: '/settings',
      icon: Icons.settings,
    ),
    RoutePopupMenuItem(
      title: 'Share',
      route: null,
      icon: Icons.share,
    ),
  ];

  @override
  initState() {
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    var list = List<BottomNavigationBarItem>();
    for (var page in _pages) {
      var item = BottomNavigationBarItem(
        icon: Icon(page['icon']),
        title: Text(page['icon_text']),
      );
      list.add(item);
    }
    return list;
  }

  _share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    String message = "Try the Age Calculator!\n" +
        "https://play.google.com/store/apps/details?id=com.festa.age_calculator";
    Share.share(message,
        subject: 'Age Calculator',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  _menuSelect(BuildContext context, RoutePopupMenuItem choice) async {
    if (choice.title == 'Settings') {
      Navigator.pushNamed(context, choice.route);
    }
    if (choice.title == 'Share') {
      _share(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppTheme.appBarBackgroundColor,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: AppTheme.appBarTextStyle,
        ),
        actions: [
          PopupMenuButton<RoutePopupMenuItem>(
            onSelected: (choice) {
              _menuSelect(context, choice);
            },
            itemBuilder: (BuildContext context) {
              return menuChoices.map((RoutePopupMenuItem item) {
                return PopupMenuItem(
                    value: item,
                    child: Row(
                      children: [
                        GradientIcon(
                          icon: item.icon,
                          gradient: AppTheme.gradient1,
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(item.title),
                      ],
                    ));
              }).toList();
            },
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: this.buildBottomNavigationBarItems(),
        selectedItemColor: AppTheme.color1,
      ),
    );
  }
}
