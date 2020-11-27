import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';

class ButtonPlus extends StatefulWidget {
  /// Todo
  /// 1- isLoading - show progress
  /// 2- tap feedback
  ///

  final Widget child;

  final bool enabled;
  final bool isCenter;
  final bool isExpanded;
  final bool isCircle;

  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final double width;

  final DecorationImage image;

  final Color color;
  final Color disabledBackgroundColor;

  final Alignment alignment;
  final Function() onPressed;
  final Function() onLongPress;

  //effects
  final Color splashColor;
  final Color highlightColor;
  final Color focusColor;
  final Color hoverColor;

  // Plus
  final RadiusPlus radius;
  final BorderPlus border;
  final List<ShadowPlus> shadows;
  final GradientPlus gradient;
  final List<InnerShadowPlus> innerShadows;
  final SkeletonPlus skeleton;

  ButtonPlus({
    Key key,
    this.child,
    this.padding = EdgeInsets.zero,
    this.margin,
    this.height = 40,
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
