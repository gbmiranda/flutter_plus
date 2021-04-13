import 'package:flutter/material.dart';

class ShadowPlus {
  /// Shadow color
  final Color color;

  /// Shadow color opacity -> 0.0 to 1.0
  final double? opacity;

  /// Shadow blur
  final double blur;

  /// Shadow spread
  final double spread;

  /// Shadow x position
  final double moveRight;

  /// Shadow y position
  final double moveDown;

  ShadowPlus({
    this.color = Colors.black,
    this.blur = 5,
    this.spread = 1,
    this.moveRight = 0,
    this.moveDown = 0,
    this.opacity,
  });
}
