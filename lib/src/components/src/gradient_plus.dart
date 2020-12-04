import 'package:flutter/material.dart';

class GradientPlus {
  /// Gradient colors
  final List<Color> colors;

  /// Gradient colors stops
  final List<double> stops;

  /// Gradient tileMode
  final TileMode tileMode;

  LinearGradient _linearGradient;

  /// Gradient linear mode
  GradientPlus.linear({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment begin = Alignment.centerLeft,
    Alignment end = Alignment.centerRight,
  }) {
    _linearGradient = LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: tileMode,
    );
  }

  RadialGradient _radialGradient;

  /// Gradient radial mode
  GradientPlus.radial({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment center = Alignment.center,
    Alignment focal = Alignment.center,
    double focalRadius = 0.0,
    double radius = 0.0,
  }) {
    _radialGradient = RadialGradient(
      colors: colors,
      center: center,
      focal: focal,
      focalRadius: focalRadius,
      radius: radius,
      stops: stops,
      tileMode: tileMode,
    );
  }

  SweepGradient _sweepGradient;

  /// Gradient sweep mode
  GradientPlus.sweep({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = 0.0,
  }) {
    _sweepGradient = SweepGradient(
      colors: colors,
      center: center,
      endAngle: endAngle,
      startAngle: startAngle,
      stops: stops,
      tileMode: tileMode,
    );
  }

  /// Transform GradientPlus to native Flutter Gradient
  Gradient get toGradient {
    if (_linearGradient != null) {
      return _linearGradient;
    } else if (_radialGradient != null) {
      return _radialGradient;
    } else if (_sweepGradient != null) {
      return _sweepGradient;
    } else {
      return null;
    }
  }
}
