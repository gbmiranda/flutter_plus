import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

final dialogPlus = DialogPlus._instance;

class DialogPlus {
  // SINGLETON
  static final _instance = DialogPlus._();
  DialogPlus._();

  void show(
    Color barrierColor,
    bool barrierDismissible,
  ) {
    FocusScope.of(navigatorPlus.currentContext).unfocus();
    showDialog(
      context: navigatorPlus.currentContext,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      routeSettings: null,
      useRootNavigator: null,
      useSafeArea: null,
      child: null,
    );
  }
}
