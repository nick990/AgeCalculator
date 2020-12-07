import 'package:age_calculator/models/Age.dart';
import 'package:flutter/material.dart';

import 'mycard_animated.dart';

class NextBirthdayWidget extends StatelessWidget {
  final AgeModel age;

  const NextBirthdayWidget({Key key, this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyCardAnimated(
      title: 'Next Birthday',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                this.age != null ? this.age.daysToNextBD.toString() : '--',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Days'),
            ],
          ),
        ],
      ),
    );
  }
}
