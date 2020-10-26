import 'package:age_calculator/pages/calculator_partial_screen.dart';
import 'package:age_calculator/pages/my_dates_partial_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, Object>> _pages;

  @override
  initState() {
    super.initState();
    this._pages = [
      {
        'page': CalculatorPartialScreen(),
        'title': 'Calculator',
        'icon': Icons.star,
      },
      {
        'page': MyDatesPartialScreen(),
        'title': 'My Dates',
        'icon': Icons.people,
      },
      // {
      //   'page': SettingsPartialScreen(),
      //   'title': 'Settings',
      //   'icon': Icons.settings,
      // }
    ];
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
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(page['icon']),
        title: Text(page['title']),
      );
      list.add(item);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: this.buildBottomNavigationBarItems(),
      ),
    );
  }
}
