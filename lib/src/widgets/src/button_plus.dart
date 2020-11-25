import 'package:flutter/material.dart';
import 'package:flutter_plus/src/components/src/border_plus.dart';
import 'package:flutter_plus/src/components/src/gradient_plus.dart';
import 'package:flutter_plus/src/components/src/inner_shadow_plus.dart';
import 'package:flutter_plus/src/components/src/radius_plus.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/components/src/skeleton_plus.dart';

import 'container_plus.dart';

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
  final Function onPressed;
  final Function onLongPress;

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

  /// When [true] show a loading effect up child.
  ///
  /// Defaults is [null].
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
    return this._buildButtomPlus();
  }

  Widget _buildButtomPlus() {
    return ContainerPlus(
      padding: EdgeInsets.zero,
      margin: this.widget.margin,
      isCenter: this.widget.isCenter,
      isExpanded: this.widget.isExpanded,
      isCircle: this.widget.isCircle,
      alignment: this.widget.alignment,
      color: this.widget.color,
      height: this.widget.height,
      width: this.widget.width,
      border: this.widget.border,
      gradient: this.widget.gradient,
      radius: this.widget.radius,
      shadows: this.widget.shadows,
      innerShadows: this.widget.innerShadows,
      skeleton: this.widget.skeleton,
      child: this._buildChildButton(),
    );
  }

  _buildChildButton() {
    return FlatButton(
      padding: this.widget.padding ?? EdgeInsets.zero,
      splashColor: this.widget.splashColor,
      highlightColor: this.widget.highlightColor,
      focusColor: this.widget.focusColor,
      hoverColor: this.widget.hoverColor,
      color: Colors.transparent,
      onHighlightChanged: (value) {},
      onPressed: this.isEnabled ? this.widget.onPressed : null,
      onLongPress: this.isEnabled ? this.widget.onLongPress : null,
      child: this.widget.child,
    );
  }

  bool get isEnabled {
    if ((this.widget.onPressed == null && this.widget.onLongPress == null) ||
        this.widget.enabled == false)
      return false;
    else
      return true;
  }
}
