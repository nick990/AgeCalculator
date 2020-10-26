import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/widgets/mycard.dart';
import 'package:flutter/material.dart';

class NextBirthdaysWidget extends StatelessWidget {
  final AgeModel age;

  const NextBirthdaysWidget({Key key, this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyCard(
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
