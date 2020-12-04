import 'package:flutter/material.dart';

class BorderPlus {
  /// Border color
  final Color color;

  /// Border width
  final double width;

  /// Border style
  final BorderStyle style;

  /// BorderPlus constructor
  BorderPlus({
    this.color = Colors.black,
    this.width = 1,
    this.style = BorderStyle.solid,
  });

  /// Transform BorderPlus to native Flutter Border
  Border get toBorder {
    if (this == null) {
      return Border.all(
        color: Colors.transparent,
        width: 0,
        style: BorderStyle.none,
      );
    } else {
      return Border.all(
        style: style,
        color: color,
        width: width,
      );
    }
  }

  /// Transform BorderPlus to native Flutter BorderSide
  BorderSide get toBorderSide {
    if (this == null) {
      return BorderSide.none;
    } else {
      return BorderSide(
        style: style,
        color: color,
        width: width,
      );
    }
  }
}
