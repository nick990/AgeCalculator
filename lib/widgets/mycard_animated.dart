import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyCardAnimated extends StatefulWidget {
  final String title;
  final Widget body;
  final IconData iconData;
  MyCardAnimated({this.title, this.body, this.iconData});

  @override
  _MyCardAnimatedState createState() => _MyCardAnimatedState();
}

class _MyCardAnimatedState extends State<MyCardAnimated>
    with SingleTickerProviderStateMixin {
  Animation<Color> animationColor;
  AnimationController controller;
  Animation<double> animationElevation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationColor = ColorTween(begin: AppTheme.color2, end: AppTheme.color1)
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });
    animationElevation = Tween<double>(begin: 0, end: 10).animate(controller)
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
  void didUpdateWidget(MyCardAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('update');
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: animationElevation.value,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        animationColor.value,
                        animationColor.value,
                        AppTheme.color2,
                      ],
                    ),
                  ),
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
