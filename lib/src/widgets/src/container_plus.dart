import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';
import '../../../src/components/src/inner_shadow_render_plus.dart';
import '../../../src/components/src/skeleton_render_plus.dart';

class ContainerPlus extends StatefulWidget {
  /// ContainerPlus child widget
  final Widget child;

  /// ContainerPlus padding
  final EdgeInsets padding;

  /// ContainerPlus margin
  final EdgeInsets margin;

  /// ContainerPlus height
  final double height;

  /// ContainerPlus width
  final double width;

  /// ContainerPlus alignment
  final Alignment alignment;

  /// ContainerPlus backgroundBlendMode
  final BlendMode backgroundBlendMode;

  /// ContainerPlus boxConstraints
  final BoxConstraints boxConstraints;

  /// ContainerPlus color when there is no gradient
  final Color color;

  /// ContainerPlus image background
  final DecorationImage image;

  /// ContainerPlus onTap action
  final Function() onTap;

  /// ContainerPlus onTapDown action
  final Function(TapDownDetails) onTapDown;

  /// ContainerPlus onTapUp action
  final Function(TapUpDetails) onTapUp;

  /// ContainerPlus onTapCancel action
  final Function() onTapCancel;

  /// ContainerPlus onDoubleTap action
  final Function() onDoubleTap;

  /// ContainerPlus onLongPress action
  final Function() onLongPress;

  /// ContainerPlus onPanUpdate action
  final Function(DragUpdateDetails) onPanUpdate;

  /// ContainerPlus onPanEnd action
  final Function(DragStartDetails) onPanStart;

  /// ContainerPlus onLongPress action
  final Function(DragEndDetails) onPanEnd;

  /// ContainerPlus onPanDown action
  final Function(DragDownDetails) onPanDown;

  /// ContainerPlus onPanCancel action
  final Function() onPanCancel;

  /// ContainerPlus radius
  final RadiusPlus radius;

  /// ContainerPlus border
  final BorderPlus border;

  /// ContainerPlus shadows
  final List<ShadowPlus> shadows;

  /// ContainerPlus gradient
  final GradientPlus gradient;

  /// ContainerPlus innerShadows
  final List<InnerShadowPlus> innerShadows;

  /// ContainerPlus skeleton
  final SkeletonPlus skeleton;

  /// ContainerPlus inside Center widget
  final bool isCenter;

  /// ContainerPlus inside Expanded widget
  final bool isExpanded;

  /// ContainerPlus circle radius
  final bool isCircle;

  /// Async notify a parent the size and position of ContainerPlus
  final Function(Size, Offset) notifyParent;

  ContainerPlus({
    Key key,
    this.height,
    this.width,
    this.color = Colors.transparent,
    this.child,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.image,
    this.alignment,
    this.backgroundBlendMode,
    this.boxConstraints,
    this.isCenter = false,
    this.isExpanded = false,
    this.isCircle = false,
    //functions
    this.onPanUpdate,
    this.onPanStart,
    this.onPanEnd,
    this.onPanDown,
    this.onPanCancel,
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
      Future.delayed(Duration(microseconds: 50), _afterLayout);
    });
    super.initState();
  }

  _afterLayout() {
    _getSizes();
    _getPositions();
    if (widget.notifyParent != null) {
      widget.notifyParent(
        _containerSize,
        _containerPostion,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var containerPlus = _buildContainerPlus();

    if (widget.isCenter == true) {
      containerPlus = Center(
        child: containerPlus,
      );
    }

    if (widget.isExpanded == true) {
      containerPlus = Expanded(
        child: containerPlus,
      );
    }

    return containerPlus;
  }

  Widget _buildContainerPlus() {
    return Container(
      key: _keyRect,
      padding: EdgeInsets.zero,
      alignment: widget.alignment,
      constraints: widget.boxConstraints,
      margin: widget.margin,
      height: widget.height,
      width: widget.width,
      decoration: _buildOutDecoration(),
      child: ClipRRect(
        borderRadius: _buildRadius(),
        child: _buildInnerShadow(
          Padding(
            padding:
                skeletonEnabled == true ? EdgeInsets.all(0) : widget.padding,
            child: skeletonEnabled == true ? _buildSkeleton() : _buildChild(),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    // to calculate height

    if (skeletonEnabled == false) {
      return widget.child;
    } else {
      return Container(
        height: _containerSize?.height ?? 0,
        width: _containerSize?.width ?? 0,
        child: SkeletonRenderPlus(
          skeletonPlus: widget.skeleton,
        ),
      );
    }
  }

  Widget _buildInnerShadow(Widget child) {
    if (widget.innerShadows == null || widget.innerShadows.isEmpty) {
      return child;
    } else {
      return InnerShadowRenderPlus(
        shadows: widget.innerShadows == null
            ? []
            : widget.innerShadows
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
          decoration: _buildInDecoration(),
          child: child,
        ),
      );
    }
  }

  Widget _buildChild() {
    if (hasGestureDetector == true) {
      return _buildGestureDetector();
    } else {
      return widget.child;
    }
  }

  Widget _buildGestureDetector() {
    return GestureDetector(
      // tap
      onTap: widget.onTap ?? null,
      onDoubleTap: widget.onDoubleTap ?? null,
      onLongPress: widget.onLongPress ?? null,
      onTapDown: widget.onTapDown ?? null,
      onTapUp: widget.onTapUp ?? null,
      onTapCancel: widget.onTapCancel ?? null,
      // pan
      onPanCancel: widget.onPanCancel ?? null,
      onPanDown: widget.onPanDown ?? null,
      onPanEnd: widget.onPanEnd ?? null,
      // onPanEnd: (details) {
      //   print('xxx');
      // },
      onPanStart: widget.onPanStart ?? null,
      onPanUpdate: widget.onPanUpdate ?? null,
      // others
      child: widget.child,
      behavior: HitTestBehavior.translucent,
    );
  }

  bool get hasGestureDetector {
    if (widget.onTap != null ||
        widget.onDoubleTap != null ||
        widget.onLongPress != null ||
        widget.onTapDown != null ||
        widget.onTapUp != null ||
        widget.onTapCancel != null ||
        widget.onPanCancel != null ||
        widget.onPanDown != null ||
        widget.onPanEnd != null ||
        widget.onPanStart != null ||
        widget.onPanUpdate != null) {
      return true;
    } else {
      return false;
    }
  }

  BoxDecoration _buildInDecoration() {
    return BoxDecoration(
      color: skeletonEnabled == true ? Colors.transparent : widget.color,
      // shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      shape: BoxShape.rectangle,
      border: _buildBorder(),
      borderRadius: _buildRadius(),
      boxShadow: _buildShadow(),
      gradient: _buildGradient(),
      image: _buildDecorationImage(),
      backgroundBlendMode: widget.backgroundBlendMode,
    );
  }

  BoxDecoration _buildOutDecoration() {
    return BoxDecoration(
      color: skeletonEnabled == true ? Colors.transparent : widget.color,
      // shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
      shape: BoxShape.rectangle,
      border: _buildBorder(),
      borderRadius: _buildRadius(),
      boxShadow: _buildShadow(),
      gradient: _buildGradient(),
      image: _buildDecorationImage(),
      backgroundBlendMode: widget.backgroundBlendMode,
    );
  }

  List<BoxShadow> _buildShadow() {
    if (widget.shadows == null || skeletonShowShadow == false) return [];
    return widget.shadows.map((shadow) {
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
    return widget.image;
  }

  Gradient _buildGradient() {
    if (widget.gradient != null) {
      return widget.gradient.toGradient;
    } else {
      return null;
    }
  }

  Border _buildBorder() {
    if (widget.border == null || skeletonShowBorder == false) {
      return Border.all(
        color: Colors.transparent,
        width: 0,
        style: BorderStyle.none,
      );
    } else {
      return widget.border.toBorder;
    }
  }

  BorderRadius _buildRadius() {
    if (widget.isCircle == true && _containerSize != null) {
      return BorderRadius.all(
        Radius.circular(_containerSize.height / 2),
      );
    } else if (widget.radius == null) {
      return BorderRadius.zero;
    } else {
      return widget.radius.toBorderRadius;
    }
  }

  _getSizes() {
    final renderBox = _keyRect?.currentContext?.findRenderObject() as RenderBox;
    if (renderBox != null) {
      final size = renderBox.size;
      setState(() {
        _containerSize = size;
      });
      // print("SIZE: $size");
    } else {
      // print('_getSizes renderBox NULL');
    }
  }

  _getPositions() {
    final renderBox = _keyRect?.currentContext?.findRenderObject() as RenderBox;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        _containerPostion = position;
      });
      // print("POSITION: $position ");
    } else {
      // print('_getPositions renderBox NULL');
    }
  }

  bool get skeletonEnabled {
    if (widget.skeleton != null &&
        widget.skeleton.enabled == true &&
        _containerSize != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get skeletonShowShadow {
    if (skeletonEnabled == false || widget.skeleton?.showShadows == true) {
      return true;
    } else {
      return false;
    }
  }

  bool get skeletonShowBorder {
    if (skeletonEnabled == false || widget.skeleton?.showBorders == true) {
      return true;
    } else {
      return false;
    }
  }
}
