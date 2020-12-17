import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';

class ButtonPlus extends StatefulWidget {
  /*
    Todo
    1- isLoading - show progress
    2- tap feedback
  */

  /// ButtonPlus child
  final Widget child;

  /// ButtonPlus padding
  final EdgeInsets padding;

  /// ButtonPlus margin
  final EdgeInsets margin;

  /// ButtonPlus height
  final double height;

  /// ButtonPlus width
  final double width;

  /// ButtonPlus alignment
  final Alignment alignment;

  /// ButtonPlus decoration image
  final DecorationImage image;

  /// ButtonPlus color when there is no gradient
  final Color color;

  /// ButtonPlus disabledBackgroundColor
  final Color disabledBackgroundColor;

  /// ButtonPlus onPressed action
  final Function() onPressed;

  /// ButtonPlus onLongPress action
  final Function() onLongPress;

  /// ButtonPlus splashColor
  final Color splashColor;

  /// ButtonPlus highlightColor
  final Color highlightColor;

  /// ButtonPlus focusColor
  final Color focusColor;

  /// ButtonPlus hoverColor
  final Color hoverColor;

  /// ButtonPlus radius
  final RadiusPlus radius;

  /// ButtonPlus border
  final BorderPlus border;

  /// ButtonPlus shadows
  final List<ShadowPlus> shadows;

  /// ButtonPlus gradient
  final GradientPlus gradient;

  /// ButtonPlus innerShadows
  final List<InnerShadowPlus> innerShadows;

  /// ButtonPlus skeleton
  final SkeletonPlus skeleton;

  /// ButtonPlus enabled -> true or false
  final bool enabled;

  /// ButtonPlus inside Center widget
  final bool isCenter;

  /// ButtonPlus inside Expanded widget
  final bool isExpanded;

  /// ButtonPlus circle radius
  final bool isCircle;

  ButtonPlus({
    Key key,
    this.child,
    this.padding = EdgeInsets.zero,
    this.margin,
    this.height,
    this.width,
    this.color,
    this.disabledBackgroundColor,
    this.alignment,
    //bools
    this.isCenter = false,
    this.isExpanded = false,
    this.isCircle = false,
    this.enabled,
    // actions
    this.onPressed,
    this.onLongPress,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    // Plus
    this.radius,
    this.border,
    this.shadows,
    this.gradient,
    this.image,
    this.skeleton,
    this.innerShadows,
  });

  @override
  _ButtomPlusState createState() => _ButtomPlusState();
}

class _ButtomPlusState extends State<ButtonPlus> {
  @override
  Widget build(BuildContext context) {
    return _buildButtomPlus();
  }

  Widget _buildButtomPlus() {
    return ContainerPlus(
      padding: EdgeInsets.zero,
      margin: widget.margin,
      isCenter: widget.isCenter,
      isExpanded: widget.isExpanded,
      isCircle: widget.isCircle,
      alignment: widget.alignment,
      color: widget.color,
      height: widget.height,
      width: widget.width,
      border: widget.border,
      gradient: widget.gradient,
      radius: widget.radius,
      shadows: widget.shadows,
      innerShadows: widget.innerShadows,
      skeleton: widget.skeleton,
      child: _buildChildButton(),
    );
  }

  Widget _buildChildButton() {
    return FlatButton(
      padding: widget.padding ?? EdgeInsets.zero,
      splashColor: widget.splashColor,
      highlightColor: widget.highlightColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      color: Colors.transparent,
      onHighlightChanged: (value) {},
      onPressed: isEnabled ? widget.onPressed : null,
      onLongPress: isEnabled ? widget.onLongPress : null,
      child: widget.child,
    );
  }

  bool get isEnabled {
    if ((widget.onPressed == null && widget.onLongPress == null) ||
        widget.enabled == false) {
      return false;
    } else {
      return true;
    }
  }
}
