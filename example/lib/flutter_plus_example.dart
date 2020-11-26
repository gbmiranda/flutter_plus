import 'package:example/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

class FlutterPlusExample extends StatefulWidget {
  @override
  _FlutterPlusExampleState createState() => _FlutterPlusExampleState();
}

class _FlutterPlusExampleState extends State<FlutterPlusExample> {
  @override
  Widget build(BuildContext context) {
    // Using FlutterAppPlus
    return FlutterAppPlus(
      title: 'Flutter Plus Example',
      home: HomeScreen(),
    );

    // Using MaterialApp

    MaterialApp(
      title: 'Flutter Plus Example',
      navigatorKey: navigatorPlus.key,
      builder: (context, child) {
        return Scaffold(
          key: snackBarPlus.scaffoldKey,
          body: child,
        );
      },
    );
  }
}
