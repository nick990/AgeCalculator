import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyCard extends StatefulWidget {
  final String title;
  final Widget body;
  final IconData iconData;
  MyCard({this.title, this.body, this.iconData});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 255).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('update');
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  // decoration: AppTheme.cardTitleDecoration,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(
                    255,
                    animation.value.toInt(),
                    animation.value.toInt(),
                    animation.value.toInt(),
                  )),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        this.widget.title,
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
          this.widget.body,
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
