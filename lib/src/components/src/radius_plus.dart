import 'package:flutter/widgets.dart';

class RadiusPlus {
  /// Radius value for all corners
  final double? all;

  /// Radius value for topLeft corner
  final double? topLeft;

  /// Radius value for topRight corner
  final double? topRight;

  /// Radius value for bottomLeft corner
  final double? bottomLeft;

  /// Radius value for bottomRight corner
  final double? bottomRight;

  /// Radius to all corners
  RadiusPlus.all(this.all)
      : topLeft = all,
        topRight = all,
        bottomLeft = all,
        bottomRight = all;

  /// Radius to specific corner
  RadiusPlus.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  }) : all = null;

  /// Radius to all top corners
  RadiusPlus.top(double radiusTop)
      : all = null,
        topLeft = radiusTop,
        topRight = radiusTop,
        bottomLeft = null,
        bottomRight = null;

  /// Radius to all bottom corners
  RadiusPlus.bottom(double radiusBottom)
      : all = null,
        topLeft = null,
        topRight = null,
        bottomLeft = radiusBottom,
        bottomRight = radiusBottom;

  /// Transform RadiusPlus to native Flutter BorderRadius
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
