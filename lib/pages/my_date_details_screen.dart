import 'package:flutter/material.dart';

import '../models/MyDate.dart';

class MyDateDetailsScreen extends StatelessWidget {
  static const routeName = '/myMateDetails';
  @override
  Widget build(BuildContext context) {
    final MyDate myDate = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(myDate.name),
      ),
    );
  }
}
