import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class ContainerPlusScreen extends StatefulWidget {
  @override
  _ContainerPlusScreenState createState() => _ContainerPlusScreenState();
}

class _ContainerPlusScreenState extends State<ContainerPlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'ContainerPlus Example',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildExample1(),
            _buildExample2(),
            _buildExample3(),
          ],
        ),
      ),
    );
  }

  Widget _buildExample1() {
    return ContainerPlus(
      width: 150,
      height: 150,
      radius: RadiusPlus.all(20),
      color: Colors.yellow,
      shadows: [
        ShadowPlus(
          color: Colors.red,
          moveDown: -10,
          moveRight: -10,
          blur: 5,
          spread: 1,
          opacity: 0.2,
        ),
        ShadowPlus(
          color: Colors.blue,
          moveDown: 10,
          moveRight: 10,
          blur: 10,
          spread: 5,
          opacity: 0.5,
        ),
      ],
      border: BorderPlus(
        color: Colors.black,
        width: 2,
      ),
      child: TextPlus(
        'EXAMPLE 1',
        isCenter: true,
        color: Colors.white,
      ),
    );
  }

  Widget _buildExample2() {
    return ContainerPlus(
      margin: EdgeInsets.only(top: 48),
      width: 150,
      height: 150,
      isCircle: true,
      gradient: GradientPlus.linear(
        colors: [
          Colors.yellow,
          Colors.orange,
          Colors.pink,
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
      innerShadows: [
        InnerShadowPlus(
          color: Colors.green,
          blur: 10,
        )
      ],
      child: TextPlus(
        'EXAMPLE 2',
        isCenter: true,
        color: Colors.white,
      ),
    );
  }

  bool skeletonEnabled = false;

  Widget _buildExample3() {
    return ContainerPlus(
      margin: EdgeInsets.only(top: 48),
      width: 150,
      height: 150,
      color: Colors.black,
      radius: RadiusPlus.only(topLeft: 40, bottomRight: 10),
      skeleton: SkeletonPlus.automatic(enabled: skeletonEnabled),
      onTap: () {
        setState(() {
          skeletonEnabled = !skeletonEnabled;
        });
        Future.delayed(Duration(seconds: 5), () {
          setState(() {
            skeletonEnabled = !skeletonEnabled;
          });
        });
      },
      child: TextPlus(
        'EXAMPLE 3',
        isCenter: true,
        color: Colors.white,
      ),
    );
  }
}
