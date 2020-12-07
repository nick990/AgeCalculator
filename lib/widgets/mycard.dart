import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyCard extends StatelessWidget {
  final String title;
  final Widget body;
  final IconData iconData;
  MyCard({this.title, this.body, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: AppTheme.gradient1,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        this.title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                            ),
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
