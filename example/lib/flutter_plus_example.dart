import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

class FlutterPlusExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }

  _teste() async {
    // DateTime.now()
    utilsPlus.closeKeyboard();
    Color customColor = utilsPlus.colorHex('FFFFFF');
    await localStoragePlus.write('lib_name', 'flutter_plus');
    await localStoragePlus.read('lib_name');
    await localStoragePlus.delete('lib_name');
    await localStoragePlus.containsKey('lib_name');
    await localStoragePlus.clear();
  }
}
