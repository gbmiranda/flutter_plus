import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextPlus(
            'FlutterPlus',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          ButtonPlus(
            margin: EdgeInsets.only(top: 16),
            isCenter: true,
            color: Colors.red,
            radius: RadiusPlus.all(12),
            child: TextPlus(
              'CLOSE',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onPressed: () {
              navigatorPlus.back();
            },
          ),
        ],
      ),
    );
  }
}
