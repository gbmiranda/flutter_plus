import 'package:flutter/widgets.dart';

class RadiusPlus {
  final double all;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  RadiusPlus.all(this.all)
      : topLeft = all,
        topRight = all,
        bottomLeft = all,
        bottomRight = all;

  RadiusPlus.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  }) : all = null;

  RadiusPlus.top(double radiusTop)
      : all = null,
        topLeft = radiusTop,
        topRight = radiusTop,
        bottomLeft = null,
        bottomRight = null;

  RadiusPlus.bottom(double radiusBottom)
      : all = null,
        topLeft = null,
        topRight = null,
        bottomLeft = radiusBottom,
        bottomRight = radiusBottom;

  BorderRadius get toBorderRadius {
    if (this == null) {
      return BorderRadius.zero;
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0),
      );
    }
  }
}
