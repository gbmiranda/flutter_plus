import 'package:flutter/material.dart';

class SkeletonPlus {
  final bool enabled;
  final bool showShadows;
  final bool showBorders;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  SkeletonPlus.custom({
    @required this.enabled,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.showShadows = false,
    this.showBorders = false,
  });

  SkeletonPlus.automatic({@required this.enabled})
      : baseColor = null,
        highlightColor = null,
        duration = Duration(milliseconds: 1500),
        showShadows = false,
        showBorders = false;
}
