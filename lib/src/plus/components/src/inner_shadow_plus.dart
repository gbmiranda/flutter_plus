import 'package:flutter/material.dart';

class InnerShadowPlus {
  final Color color;
  final double opacity;
  final double blur;
  final double moveRight;
  final double moveDown;

  InnerShadowPlus({
    this.color = Colors.black,
    this.blur = 4,
    this.moveRight = 0,
    this.moveDown = 0,
    this.opacity,
  });
}
