import 'package:age_calculator/models/Lifetime.dart';
import 'package:age_calculator/widgets/mycard_animated.dart';
import 'package:flutter/material.dart';

class LifetimeWidget extends StatelessWidget {
  final LifeTime lifetime;
  LifetimeWidget({this.lifetime});

  String formatNumber(int number) {
    var numberAsString = number.toString();
    print(numberAsString);
    var formattedString = "";
    for (int i = 0; i < numberAsString.length; i++) {
      formattedString += numberAsString[i];
      if ((i != numberAsString.length - 1) &&
          (numberAsString.length - i - 1) % 3 == 0) {
        formattedString += ".";
      }
    }
    return formattedString;
  }

  @override
  Widget build(BuildContext context) {
    return MyCardAnimated(
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
                    formatNumber(lifetime.years),
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
                    formatNumber(lifetime.months),
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
                    formatNumber(lifetime.days),
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
                    formatNumber(lifetime.hours),
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
                    formatNumber(lifetime.minutes),
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
                    formatNumber(lifetime.seconds),
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
