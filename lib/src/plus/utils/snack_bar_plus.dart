// https://www.youtube.com/watch?v=JdYP9YoO6gU
// asuka dependece

import 'package:flutter/material.dart';

final snackBarPlus = SnackBarPlus._instance;

class SnackBarPlus {
  static final _instance = SnackBarPlus();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void show(
    String text, {
    Color backgroundColor,
    Duration duration,
  }) {
    var _snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: duration ?? Duration(seconds: 2),
    );
    scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  void showDialog(String text) {}

  void showBottonSheet(String text) {}
}
