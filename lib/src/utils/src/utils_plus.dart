import 'package:flutter/material.dart';

final utilsPlus = UtilsPlus._instance;

class UtilsPlus {
  static final _instance = UtilsPlus._();
  UtilsPlus._();

  /// Closes the keyboard if it is open
  void closeKeyboard() {
    FocusManager.instance.primaryFocus!.unfocus();
  }

  /// Turns a hexadecimal String to Color
  Color colorHex(String hex) {
    if (hex == null) {
      return Colors.transparent;
    } else {
      return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
    }
  }

  /// Turns a Color to String hexadecimal
  String colorToHex(Color color) {
    return color.value.toRadixString(16);
  }
}
