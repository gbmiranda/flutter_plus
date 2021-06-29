import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

import 'src/screens/home_screen.dart';

class FlutterPlusExample extends StatefulWidget {
  @override
  _FlutterPlusExampleState createState() => _FlutterPlusExampleState();
}

class _FlutterPlusExampleState extends State<FlutterPlusExample> {
  @override
  Widget build(BuildContext context) {
    DateTime now;
    print('XXX -> ${now.format('dd/MM/yyyy HH:mm:ss')}');

    // Using FlutterAppPlus
    return FlutterAppPlus(
      title: 'Flutter Plus Example',
      home: HomeScreen(),
    );

    // Using MaterialApp
    // MaterialApp(
    //   title: 'Flutter Plus Example',
    //   navigatorKey: navigatorPlus.key,
    //   builder: (context, child) {
    //     return Scaffold(
    //       key: snackBarPlus.scaffoldKey,
    //       body: child,
    //     );
    //   },
    // );
  }
}
