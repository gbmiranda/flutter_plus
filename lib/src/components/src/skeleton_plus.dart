import 'package:flutter/material.dart';

class SkeletonPlus {
  /// Skeleton animation enabled or disabled -> true or false
  final bool enabled;

  /// Skeleton show widget shadows -> true or false
  final bool showShadows;

  /// Skeleton show widget borders -> true or false
  final bool showBorders;

  /// Skeleton base color
  final Color? baseColor;

  /// Skeleton animated color
  final Color? highlightColor;

  /// Skeleton animation duration
  final Duration? duration;

  /// Custom Skeleton animation
  SkeletonPlus.custom({
    required this.enabled,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.showShadows = false,
    this.showBorders = false,
  });

  /// Default Skeleton animation
  SkeletonPlus.automatic({required this.enabled})
      : baseColor = null,
        highlightColor = null,
        duration = Duration(milliseconds: 1500),
        showShadows = false,
        showBorders = false;
}
