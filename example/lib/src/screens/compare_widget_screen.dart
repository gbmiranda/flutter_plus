import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class CompareWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'Compare Widgets',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: utilsPlus.colorHex('161718'),
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
            _buildContainerPlus(),
            SizedBox(
              height: 48,
            ),
            _buildNativeContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildNativeContainer() {
    return GestureDetector(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow.withOpacity(
                0.6,
              ),
              blurRadius: 6,
              offset: Offset(
                -5,
                -5,
              ),
            ),
            BoxShadow(
              color: Colors.green.withOpacity(
                0.6,
              ),
              blurRadius: 6,
              offset: Offset(
                5,
                5,
              ),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        print('NativeContainer');
      },
    );
  }

  Widget _buildContainerPlus() {
    return ContainerPlus(
      height: 200,
      width: 200,
      radius: RadiusPlus.all(30),
      gradient: GradientPlus.linear(
        colors: [
          Colors.pink,
          Colors.blue,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shadows: [
        ShadowPlus(
          color: Colors.yellow,
          opacity: 0.6,
          blur: 6,
          moveDown: -5,
          moveRight: -5,
        ),
        ShadowPlus(
          color: Colors.green,
          opacity: 0.6,
          blur: 6,
          moveDown: 5,
          moveRight: 5,
        ),
      ],
      border: BorderPlus(
        color: Colors.white,
        width: 2,
      ),
      child: TextPlus(
        'ContainerPlus',
        isCenter: true,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onTap: () {
        print('FlutterPlus');
      },
    );
  }
}
