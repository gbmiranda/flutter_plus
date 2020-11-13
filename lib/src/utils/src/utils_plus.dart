import 'package:flutter/material.dart';

final utilsPlus = UtilsPlus._instance;

class UtilsPlus {
  static final _instance = UtilsPlus._();
  UtilsPlus._();

  closeKeyboard() {
    FocusManager.instance.primaryFocus.unfocus();
    // FocusScope.of(navigatorPlus.currentContext).unfocus();
  }

  Color colorHex(String hex) {
    if (hex == null) {
      return Colors.transparent;
    } else {
      return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
    }
  }

  String colorToHex(Color color) {
    return color.value.toRadixString(16);
  }
}
