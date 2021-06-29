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
    return Border.all(
      style: style,
      color: color,
      width: width,
    );
  }

  /// Transform BorderPlus to native Flutter BorderSide
  BorderSide get toBorderSide {
    return BorderSide(
      style: style,
      color: color,
      width: width,
    );
  }
}
