import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

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
      body: this._buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            this._buildExample1(),
            this._buildExample2(),
            this._buildExample3(),
          ],
        ),
      ),
    );
  }

  _buildExample1() {
    ContainerPlus(
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

  _buildExample2() {
    ContainerPlus(
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

  _buildExample3() {
    ContainerPlus(
      margin: EdgeInsets.only(top: 48),
      width: 150,
      height: 150,
      color: Colors.black,
      radius: RadiusPlus.only(topLeft: 40, bottomRight: 10),
      skeleton: SkeletonPlus.automatic(enabled: this.skeletonEnabled),
      onTap: () {
        setState(() {
          this.skeletonEnabled = !this.skeletonEnabled;
        });
        Future.delayed(Duration(seconds: 5), () {
          setState(() {
            this.skeletonEnabled = !this.skeletonEnabled;
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
