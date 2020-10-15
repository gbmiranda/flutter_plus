import 'package:flutter/material.dart';

class SkeletonPlus {
  final bool enabled;
  final bool showShadows;
  final bool showBorders;
  final List<Color> colors;
  final int duration;

  SkeletonPlus({
    @required this.enabled,
    this.colors,
    this.duration = 800,
    this.showShadows = false,
    this.showBorders = false,
  });
}
