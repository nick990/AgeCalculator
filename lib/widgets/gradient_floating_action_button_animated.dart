import 'package:age_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GradientFloatingActionButtonAnimated extends StatefulWidget {
  final double size;
  final double elevation;
  final double iconSize;
  final Function onPressed;
  final IconData iconData;
  final ColorTween colorTween;

  GradientFloatingActionButtonAnimated({
    Key key,
    this.size,
    this.iconSize,
    this.elevation,
    this.onPressed,
    this.iconData,
    this.colorTween,
  }) : super(key: key);

  @override
  _GradientFloatingActionButtonAnimatedState createState() =>
      _GradientFloatingActionButtonAnimatedState();
}

class _GradientFloatingActionButtonAnimatedState
    extends State<GradientFloatingActionButtonAnimated>
    with SingleTickerProviderStateMixin {
  Animation<Color> animationColor;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animationColor = widget.colorTween.animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.widget.size,
      height: this.widget.size,
      child: FloatingActionButton(
        elevation: this.widget.elevation,
        onPressed: this.widget.onPressed,
        child: Container(
          width: this.widget.size,
          height: this.widget.size,
          child: Icon(widget.iconData, size: this.widget.iconSize),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: <Color>[
                AppTheme.color4,
                AppTheme.color4,
                animationColor.value,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
