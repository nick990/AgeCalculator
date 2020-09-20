import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final Widget body;

  MyCard({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      color: Theme.of(context).primaryColor,
                      child: Center(
                        child: Text(
                          this.title,
                          style: Theme.of(context).textTheme.headline4,
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
        ],
      ),
    );
  }
}
