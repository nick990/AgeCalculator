import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final Widget body;
  final IconData iconData;
  MyCard({this.title, this.body, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: AppTheme.cardTitleDecoration,
                  child: Center(
                    child: Text(
                      this.title,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          this.body,
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
