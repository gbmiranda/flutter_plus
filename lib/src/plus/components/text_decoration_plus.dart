import 'package:flutter/material.dart';

class TextDecorationPlus {
  final TextDecoration textDecoration;
  final Color color;
  final TextDecorationStyle decorationStyle;
  final double decorationThickness;

  TextDecorationPlus({
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
    this.decorationStyle = TextDecorationStyle.solid,
    this.decorationThickness = 1.0,
  });
}
