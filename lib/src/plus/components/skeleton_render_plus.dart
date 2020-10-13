import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/components/skeleton_plus.dart';

class SkeletonRenderPlus extends StatefulWidget {
  final SkeletonPlus skeletonX;
  SkeletonRenderPlus({@required this.skeletonX});

  createState() => SkeletonRenderPlusState();
}

class SkeletonRenderPlusState extends State<SkeletonRenderPlus>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(
          milliseconds: this.widget.skeletonX.duration,
        ),
        vsync: this);
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
          colors: this.widget.skeletonX.colors != null
              ? this.widget.skeletonX.colors
              : [
                  Colors.black12,
                  Colors.black.withOpacity(0.08),
                  Colors.black12,
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
