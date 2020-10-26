import 'package:flutter/material.dart';

class MyDatesPartialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Dates'),
      ),
      body: SingleChildScrollView(
        child: Text('My Dates'),
      ),
    );
  }
}
