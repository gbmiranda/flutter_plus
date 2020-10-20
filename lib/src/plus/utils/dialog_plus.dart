import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_plus/src/plus/utils/flutter_plus_utils.dart';

final dialogPlus = DialogPlus._instance;

class DialogPlus {
  static final _instance = DialogPlus._();
  DialogPlus._();

  void show(
    Widget child,
    Color barrierColor,
    bool barrierDismissible,
    bool useRootNavigator,
    bool useSafeArea,
    RouteSettings routeSettings,
    Function(BuildContext) builder,
    bool closeKeyboardWhenOpen,
  ) {
    if (closeKeyboardWhenOpen) {
      flutterPlusUtils.closeKeyboard();
    }
    showDialog(
      context: navigatorPlus.currentContext,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      child: child,
      builder: builder,
    );
  }
}
