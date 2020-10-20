import 'package:flutter/material.dart';
import 'package:flutter_plus/src/components/src/skeleton_plus.dart';
import 'package:flutter_plus/src/utils/src/utils_plus.dart';

class SkeletonRenderPlus extends StatefulWidget {
  final SkeletonPlus skeletonPlus;
  SkeletonRenderPlus({@required this.skeletonPlus});

  createState() => SkeletonRenderPlusState();
}

class SkeletonRenderPlusState extends State<SkeletonRenderPlus>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(
      duration:
          this.widget.skeletonPlus.duration ?? Duration(milliseconds: 1500),
      vsync: this,
    );
    gradientPosition = Tween<double>(
      begin: -30,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(
        () {
          setState(() {});
        },
      );

    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: Alignment(2, 0),
          colors: [
            this.widget.skeletonPlus.baseColor ?? utilsPlus.colorHex('E0E0E0'),
            this.widget.skeletonPlus.highlightColor ??
                utilsPlus.colorHex('F0F1F1'),
            this.widget.skeletonPlus.baseColor ?? utilsPlus.colorHex('E0E0E0'),
          ],
          stops: [
            0.2,
            0.6,
            0.9,
          ],
        ),
      ),
    );
  }
}
