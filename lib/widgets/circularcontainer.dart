import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.padding = 0,
    this.radius = 400,
    this.backgroundcolor = Colors.white,
    this.child,
   this.opacity=1,
    this.margin,
    
  });
  final double height;
  final double ?width;
  final double padding;
  final double radius;
  final Widget? child;
  final Color backgroundcolor;
  final double opacity;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor.withOpacity(opacity),
      ),
      child: child,
    );
  }
}
