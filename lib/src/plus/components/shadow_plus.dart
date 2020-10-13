import 'package:flutter/material.dart';

class ShadowPlus {
  final Color color;
  // final ShadowXEnum shadowX;
  final double opacity;
  final double blur;
  final double spread;
  final double moveRight;
  final double moveDown;

  ShadowPlus({
    this.color = Colors.black,
    this.blur = 4,
    this.spread = 2,
    this.moveRight = 0,
    this.moveDown = 0,
    this.opacity = 1,
    // this.shadowX,
  });
}
