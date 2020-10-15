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
  }) : this.all = null;

  RadiusPlus.top(double radiusTop)
      : this.all = null,
        this.topLeft = radiusTop,
        this.topRight = radiusTop,
        this.bottomLeft = null,
        this.bottomRight = null;

  RadiusPlus.bottom(double radiusBottom)
      : this.all = null,
        this.topLeft = null,
        this.topRight = null,
        this.bottomLeft = radiusBottom,
        this.bottomRight = radiusBottom;

  BorderRadius get toBorderRadius {
    if (this == null)
      return BorderRadius.zero;
    else
      return BorderRadius.only(
        topLeft: Radius.circular(this.topLeft ?? 0),
        topRight: Radius.circular(this.topRight ?? 0),
        bottomLeft: Radius.circular(this.bottomLeft ?? 0),
        bottomRight: Radius.circular(this.bottomRight ?? 0),
      );
  }
}
