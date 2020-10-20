import 'package:flutter/material.dart';
import 'package:flutter_plus/src/components/src/border_plus.dart';
import 'package:flutter_plus/src/components/src/gradient_plus.dart';
import 'package:flutter_plus/src/components/src/inner_shadow_plus.dart';
import 'package:flutter_plus/src/components/src/inner_shadow_render_plus.dart';
import 'package:flutter_plus/src/components/src/radius_plus.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/components/src/skeleton_plus.dart';
import 'package:flutter_plus/src/components/src/skeleton_render_plus.dart';

class ContainerPlus extends StatefulWidget {
  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsets padding;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsets margin;

  final double height;
  final double width;

  final Alignment alignment;
  final BlendMode backgroundBlendMode;
  final BoxConstraints boxConstraints;

  /// Container color when there is no gradient.
  final Color color;

  /// Image background.
  final DecorationImage image;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  // Custom

  /// X tap on [ContainerPlus].
  final Function onTap;

  /// X tap on [ContainerPlus].
  final Function(TapDownDetails) onTapDown;

  /// X tap on [ContainerPlus].
  final Function(TapUpDetails) onTapUp;

  /// X tap on [ContainerPlus].
  final Function onTapCancel;

  /// Double tap on [ContainerPlus].
  final Function onDoubleTap;

  /// Long press on [ContainerPlus].
  final Function onLongPress;

  /// Notify a parent when the update size and position.
  ///
  /// Defaults is [null].
  final Function(Size, Offset) notifyParent;

  /// When [true] place the container inside a [Center] widget.
  ///
  /// Defaults is [false].
  final bool isCenter;

  /// When [true] place the container inside a [Expanded] widget.
  ///
  /// Defaults is [false].
  final bool isExpanded;

  /// When [true] force a circle container.
  ///
  /// Defaults is [false].
  final bool isCircle;

  // XPackage

  /// When [true] show a loading effect up child.
  ///
  /// Defaults is [null].
  final SkeletonPlus skeleton;

  /// X class to set [radius] on container.
  ///
  /// Defaults is [null].
  final RadiusPlus radius;

  /// X class to set [border] on container.
  ///
  /// Defaults is [null].
  final BorderPlus border;

  /// X class to set [shadow] on container.
  ///
  /// Defaults is [null].
  final List<ShadowPlus> shadows;

  /// X class to set [shadow] on container.
  ///
  /// Defaults is [null].
  final List<InnerShadowPlus> innerShadows;

  /// X class to set [gradient] on container.
  ///
  /// Defaults is [null].
  final GradientPlus gradient;

  ContainerPlus({
    Key key,
    this.height,
    this.width,
    this.color,
    this.child,
    this.padding,
    this.margin,
    this.image,
    this.alignment,
    this.backgroundBlendMode,
    this.boxConstraints,
    this.isCenter = false,
    this.isExpanded = false,
    this.isCircle = false,
    //functions
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.notifyParent,
    // Plus
    this.skeleton,
    this.radius,
    this.border,
    this.gradient,
    this.shadows,
    this.innerShadows,
  }) : super(key: key);

  @override
  _ContainerPlusState createState() => _ContainerPlusState();

  // static _ContainerPlusState _containerPlusState;

  // @override
  // _ContainerPlusState createState() {
  //   _containerPlusState = _ContainerPlusState();
  //   return _ContainerPlusState();
  // }

  // Future<Size> get size async {
  //   return Future.delayed(Duration(milliseconds: 50), () {
  //     return _containerPlusState?._containerSize;
  //   });
  // }

  // Size get containerSize {
  //   if (_containerPlusState == null)
  //     return null;
  //   else
  //     return _containerPlusState._containerSize;
  // }
}

class _ContainerPlusState extends State<ContainerPlus> {
  final _keyRect = GlobalKey();
  Size _containerSize;
  Offset _containerPostion;

  @override
  void initState() {
    // close previus keyboard (add to navigatorObservers)
    FocusManager?.instance?.primaryFocus?.unfocus();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // delay principalmente para casos por exemplo que o teclado está aberto
      Future.delayed(Duration(milliseconds: 50), () {
        this._afterLayout();
      });
    });
    super.initState();
  }

  _afterLayout() {
    _getSizes();
    _getPositions();

    if (this.widget.notifyParent != null)
      this.widget.notifyParent(
            this._containerSize,
            this._containerPostion,
          );
  }

  @override
  Widget build(BuildContext context) {
    Widget containerPlus = this._buildContainerPlus();

    if (this.widget.isCenter == true)
      containerPlus = Center(
        child: containerPlus,
      );

    if (this.widget.isExpanded == true)
      containerPlus = Expanded(
        child: containerPlus,
      );
    return containerPlus;
  }

  _buildContainerPlus() {
    return Container(
      key: this._keyRect,
      padding: this.skeletonEnabled == true
          ? EdgeInsets.all(0)
          : this.widget.padding,
      alignment: this.widget.alignment,
      constraints: this.widget.boxConstraints,
      margin: this.widget.margin,
      height: this.widget.height,
      width: this.widget.width,
      decoration: this._buildOutDecoration(),
      child: ClipRRect(
        borderRadius: this._buildRadius(),
        child: this.skeletonEnabled == true
            ? this._buildSkeleton()
            : this._buildInnerShadow(
                this._buildChild(),
              ),
      ),
    );
  }

  _buildSkeleton() {
    // to calculate height
    if (this.skeletonEnabled == false)
      return this.widget.child;
    else
      return Container(
        height: this._containerSize?.height ?? 0,
        child: SkeletonRenderPlus(
          skeletonPlus: this.widget.skeleton,
        ),
      );
  }

  Widget _buildInnerShadow(Widget child) {
    return InnerShadowRenderPlus(
      shadows: this.widget.innerShadows == null
          ? []
          : this
              .widget
              .innerShadows
              .map(
                (innerShadow) => Shadow(
                  color: innerShadow.color,
                  blurRadius: innerShadow.blur,
                  offset: Offset(
                    innerShadow.moveRight,
                    innerShadow.moveDown,
                  ),
                ),
              )
              .toList(),
      child: Container(
        decoration: this._buildInDecoration(),
        child: child,
      ),
    );
  }

  _buildChild() {
    if (this.hasGestureDetector == true) {
      return this._buildGestureDetector();
    } else {
      return this.widget.child;
    }
  }

  _buildGestureDetector() {
    return GestureDetector(
      onTap: this.widget.onTap ?? null,
      onDoubleTap: this.widget.onDoubleTap ?? null,
      onLongPress: this.widget.onLongPress ?? null,
      onTapDown: this.widget.onTapDown ?? null,
      onTapUp: this.widget.onTapUp ?? null,
      onTapCancel: this.widget.onTapCancel ?? null,
      child: widget.child,
    );
  }

  bool get hasGestureDetector {
    if (this.widget.onTap != null ||
        this.widget.onDoubleTap != null ||
        this.widget.onLongPress != null ||
        this.widget.onTapDown != null ||
        this.widget.onTapUp != null ||
        this.widget.onTapCancel != null)
      return true;
    else
      return false;
  }

  BoxDecoration _buildInDecoration() {
    return BoxDecoration(
      color: this.skeletonEnabled == true ? Colors.transparent : widget.color,
      // shape: this.widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      // border: this._buildBorder(),
      borderRadius: this._buildRadius(),
      // boxShadow: this._buildShadow(),
      gradient: this._buildGradient(),
      image: this._buildDecorationImage(),
      backgroundBlendMode: this.widget.backgroundBlendMode,
    );
  }

  BoxDecoration _buildOutDecoration() {
    return BoxDecoration(
      color: this.skeletonEnabled == true ? Colors.transparent : widget.color,
      shape: BoxShape.rectangle,
      border: this._buildBorder(),
      borderRadius: this._buildRadius(),
      boxShadow: this._buildShadow(),
      gradient: this._buildGradient(),
      image: this._buildDecorationImage(),
      backgroundBlendMode: this.widget.backgroundBlendMode,
    );
  }

  List<BoxShadow> _buildShadow() {
    if (this.widget.shadows == null || this.skeletonShowShadow == false)
      return [];
    return this.widget.shadows.map((shadow) {
      return BoxShadow(
        color: shadow.opacity != null
            ? shadow.color.withOpacity(shadow.opacity)
            : shadow.color,
        blurRadius: shadow.blur,
        spreadRadius: shadow.spread,
        offset: Offset(
          shadow.moveRight,
          shadow.moveDown,
        ),
      );
    }).toList();
  }

  DecorationImage _buildDecorationImage() {
    return this.widget.image;
  }

  Gradient _buildGradient() {
    if (this.widget.gradient == null)
      return null;
    else
      return this.widget.gradient.gradient;
  }

  Border _buildBorder() {
    if (this.widget.border == null || this.skeletonShowBorder == false)
      return Border.all(
        color: Colors.transparent,
        width: 0,
        style: BorderStyle.none,
      );
    else
      return this.widget.border.toBorder;
  }

  BorderRadius _buildRadius() {
    if (this.widget.isCircle)
      return BorderRadius.all(
        Radius.circular(this.widget.height / 2),
      );
    else if (this.widget.radius == null)
      return BorderRadius.zero;
    else {
      return this.widget.radius.toBorderRadius;
    }
  }

  _getSizes() {
    final RenderBox renderBox =
        this._keyRect?.currentContext?.findRenderObject();
    if (renderBox != null) {
      final size = renderBox.size;
      setState(() {
        this._containerSize = size;
      });
      // print("SIZE: $size");
    } else {
      // print('_getSizes renderBox NULL');
    }
  }

  _getPositions() {
    final RenderBox renderBox = _keyRect?.currentContext?.findRenderObject();
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        this._containerPostion = position;
      });
      // print("POSITION: $position ");
    } else {
      // print('_getPositions renderBox NULL');
    }
  }

  bool get skeletonEnabled {
    if (this.widget.skeleton != null &&
        this.widget.skeleton.enabled == true &&
        this._containerSize != null)
      return true;
    else
      return false;
  }

  bool get skeletonShowShadow {
    if (this.skeletonEnabled == false ||
        this.widget.skeleton?.showShadows == true) {
      return true;
    } else {
      return false;
    }
    // if (this.skeletonEnabled == true &&
    //     this.widget.skeleton.showShadows == true)
    //   return true;
    // else
    //   return false;
  }

  bool get skeletonShowBorder {
    if (this.skeletonEnabled == false ||
        this.widget.skeleton?.showBorders == true) {
      return true;
    } else {
      return false;
    }
  }
}
