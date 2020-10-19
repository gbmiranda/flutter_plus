import 'package:flutter/material.dart';
import 'package:flutter_plus/src/library/services/alert_plus.dart';
import 'package:flutter_plus/src/library/services/navigator_plus.dart';

class FlutterPlusApp extends StatelessWidget {
  final Widget child;

  FlutterPlusApp({@required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorPlus.key,
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: analytics),
      ],
      builder: (context, child) {
        return Scaffold(
          key: SnackBarPlus.instance.scaffoldKey,
          body: child,
        );
      },
      home: this.child,
    );
  }
}
