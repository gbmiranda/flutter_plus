import 'package:flutter/material.dart';
import 'package:flutter_plus/src/components/src/border_plus.dart';
import 'package:flutter_plus/src/components/src/gradient_plus.dart';
import 'package:flutter_plus/src/components/src/radius_plus.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';

import 'container_plus.dart';

class ButtonPlus extends StatefulWidget {
  /// Todo
  ///
  /// 1- isLoading - show progress
  /// 2- isSkeleton

  final Widget child;

  final bool enabled;
  final bool useSkeleton;
  final bool isCenter;
  final bool isExpanded;
  // final bool elevation;

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

  // XPackage
  final RadiusPlus radius;
  final BorderPlus border;
  final List<ShadowPlus> shadow;
  final GradientPlus gradient;

  ButtonPlus({
    Key key,
    this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.color = Colors.transparent,
    this.disabledBackgroundColor,
    this.alignment,
    //bools
    this.isCenter,
    this.isExpanded,
    this.enabled,
    this.useSkeleton,
    // actions
    this.onPressed,
    this.onLongPress,
    this.splashColor,
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    // X
    this.radius,
    this.border,
    this.shadow,
    this.gradient,
    this.image,
  });
  // : this.super(key: key);

  @override
  _ButtomXState createState() => _ButtomXState();
}

class _ButtomXState extends State<ButtonPlus> {
  // bool showElevation;

  ContainerPlus _ContainerPlus;

  @override
  void initState() {
    // this.showElevation = this.widget.elevation;
    super.initState();
  }

  @override
  void didUpdateWidget(ButtonPlus oldWidget) {
    // this.showElevation = this.widget.elevation;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return this._buildButtomX();
  }

  Widget _buildButtomX() {
    _ContainerPlus = ContainerPlus(
      padding: EdgeInsets.all(0),
      margin: this.widget.margin,
      isCenter: this.widget.isCenter,
      isExpanded: this.widget.isExpanded,
      alignment: this.widget.alignment,
      color: this.isEnabled
          ? this.widget.color
          : this.widget.disabledBackgroundColor ??
              this.widget.color.withOpacity(0.4),
      height: this.widget.height,
      width: this.widget.width,
      // useSkeleton: this.widget.useSkeleton,
      border: this.widget.border,
      gradient: this.isEnabled ? this.widget.gradient : null,
      radius: this.widget.radius,
      shadows: this.widget.shadow,
      // notifyParent: () => setState(() {}),
      child: this._buildChildButton(),
    );
    return _ContainerPlus;
  }

  _buildChildButton() {
    return FlatButton(
      padding: this.widget.useSkeleton == true
          ? EdgeInsets.all(0)
          : this.widget.padding,
      splashColor: this.widget.splashColor,
      highlightColor: this.widget.highlightColor,
      focusColor: this.widget.focusColor,
      hoverColor: this.widget.hoverColor,
      // sempre transparente para usar a cor do container
      color: Colors.transparent,
      onHighlightChanged: (value) {},
      onPressed: this.isEnabled ? this.widget.onPressed : null,
      onLongPress: this.isEnabled ? this.widget.onLongPress : null,
      child: this.widget.child,
    );
  }

  // Widget _buildElevationContainer({@required Widget buttonChild}) {
  //   return Container(
  //     foregroundDecoration: _ContainerPlus?.containerSize == null
  //         ? null
  //         : BoxDecoration(
  //             boxShadow: showElevation == true
  //                 ? [
  //                     BoxShadow(
  //                       color: Colors.black26,
  //                       spreadRadius: -2,
  //                       blurRadius: 8,
  //                       offset: Offset(
  //                           0, _ContainerPlus.containerSize.height - 10.0),
  //                     ),
  //                     BoxShadow(
  //                       color: Colors.black26,
  //                       spreadRadius: -2,
  //                       blurRadius: 8,
  //                       offset: Offset(
  //                           _ContainerPlus.containerSize.width - 10.0, 0),
  //                     ),
  //                   ]
  //                 : null,
  //           ),
  //     child: buttonChild,
  //   );
  // }

  bool get isEnabled {
    if ((this.widget.onPressed == null && this.widget.onLongPress == null) ||
        this.widget.enabled == false)
      return false;
    else
      return true;
  }
}
