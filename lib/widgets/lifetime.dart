import 'package:age_calculator/models/Lifetime.dart';
import 'package:flutter/material.dart';

import 'mycard.dart';

class LifetimeWidget extends StatelessWidget {
  final LifeTime lifetime;
  LifetimeWidget({this.lifetime});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      title: 'Lifetime',
      body: Table(
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Years \t',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.years.toString() : '-',
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Months \t',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.months.toString() : '-',
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Days  \t",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.days.toString() : '-',
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Hours \t',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.hours.toString() : '-',
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Minutes \t',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.minutes.toString() : '-',
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Seconds \t',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    this.lifetime != null ? lifetime.seconds.toString() : '-',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
