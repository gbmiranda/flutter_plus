import 'package:flutter/material.dart';

class BorderPlus {
  final Color color;
  final double width;
  final BorderStyle style;

  BorderPlus({
    this.color = Colors.black,
    this.width = 1,
    this.style = BorderStyle.solid,
  });

  Border get toBorder {
    if (this == null)
      return Border.all(
        color: Colors.transparent,
        width: 0,
        style: BorderStyle.none,
      );
    else
      return Border.all(
        style: this.style,
        color: this.color,
        width: this.width,
      );
  }

  BorderSide get toBorderSide {
    if (this == null)
      return BorderSide.none;
    else
      return BorderSide(
        style: this.style,
        color: this.color,
        width: this.width,
      );
  }
}
