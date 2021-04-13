import 'package:flutter/material.dart';

class InnerShadowPlus {
  /// InnerShadow color
  final Color color;

  /// InnerShadow color opacity -> 0.0 to 1.0
  final double? opacity;

  /// InnerShadow blur
  final double blur;

  /// InnerShadow x position
  final double moveRight;

  /// InnerShadow y position
  final double moveDown;

  InnerShadowPlus({
    this.color = Colors.black,
    this.blur = 4,
    this.moveRight = 0,
    this.moveDown = 0,
    this.opacity,
  });
}
