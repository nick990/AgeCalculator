import 'package:age_calculator/models/Age.dart';
import 'package:age_calculator/widgets/mycard.dart';
import 'package:flutter/material.dart';

class AgeWidget extends StatelessWidget {
  final AgeModel age;

  const AgeWidget({Key key, this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyCard(
      title: 'Age',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                this.age != null ? age.years.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Years'),
            ],
          ),
          Column(
            children: [
              Text(
                this.age != null ? this.age.months.toString() : '-',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Months'),
            ],
          ),
          Column(
            children: [
              Text(
                this.age != null ? this.age.days.toString() : '-',
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
