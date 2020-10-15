import 'package:flutter/material.dart';

class GradientPlus {
  final List<Color> colors;
  final List<double> stops;
  final TileMode tileMode;

  LinearGradient _linearGradient;
  GradientPlus.linear({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment begin = Alignment.centerLeft,
    Alignment end = Alignment.centerRight,
  }) {
    this._linearGradient = LinearGradient(
      colors: this.colors,
      begin: begin,
      end: end,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }

  RadialGradient _radialGradient;
  GradientPlus.radial({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment center = Alignment.center,
    Alignment focal = Alignment.center,
    double focalRadius = 0.0,
    double radius = 0.0,
  }) {
    this._radialGradient = RadialGradient(
      colors: this.colors,
      center: center,
      focal: focal,
      focalRadius: focalRadius,
      radius: radius,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }

  SweepGradient _sweepGradient;
  GradientPlus.sweep({
    @required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    Alignment center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = 0.0,
  }) {
    this._sweepGradient = SweepGradient(
      colors: this.colors,
      center: center,
      endAngle: endAngle,
      startAngle: startAngle,
      stops: this.stops,
      tileMode: this.tileMode,
    );
  }

  Gradient get gradient {
    if (this._linearGradient != null)
      return this._linearGradient;
    else if (this._radialGradient != null)
      return this._radialGradient;
    else if (this._sweepGradient != null)
      return this._sweepGradient;
    else
      return null;
  }
}
