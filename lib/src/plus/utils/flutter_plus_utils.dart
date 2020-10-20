import 'package:flutter/material.dart';

final flutterPlusUtils = FlutterPlusUtils._instance;

class FlutterPlusUtils {
  static final _instance = FlutterPlusUtils._();
  FlutterPlusUtils._();

  closeKeyboard() {
    FocusManager.instance.primaryFocus.unfocus();
    // FocusScope.of(navigatorPlus.currentContext).unfocus();
  }
}
