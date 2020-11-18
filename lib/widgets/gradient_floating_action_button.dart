import 'package:flutter/material.dart';

class GradientFloatingActionButton extends StatelessWidget {
  final double size;
  final double elevation;
  final double iconSize;
  final Function onPressed;
  final IconData iconData;
  final Gradient gradient;

  const GradientFloatingActionButton(
      {Key key,
      this.size,
      this.iconSize,
      this.elevation,
      this.onPressed,
      this.iconData,
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.size,
      height: this.size,
      child: FloatingActionButton(
        elevation: this.elevation,
        onPressed: this.onPressed,
        child: Container(
          width: this.size,
          height: this.size,
          child: Icon(iconData, size: this.iconSize),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: this.gradient,
          ),
        ),
      ),
    );
  }
}
