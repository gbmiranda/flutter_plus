import 'package:flutter/material.dart';

class TextDecorationPlus {
  /// Native Flutter TextDecoration
  final TextDecoration textDecoration;

  /// TextDecorationPlus color
  final Color color;

  /// Native Flutter TextDecorationStyle
  final TextDecorationStyle decorationStyle;

  /// TextDecorationPlus decorationThickness
  final double decorationThickness;

  TextDecorationPlus({
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
    this.decorationStyle = TextDecorationStyle.solid,
    this.decorationThickness = 1.0,
  });
}
