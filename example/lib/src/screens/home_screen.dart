import 'package:example/src/screens/container_plus_screen.dart';
import 'package:example/src/screens/rich_text_plus_screen.dart';
import 'package:example/src/screens/text_field_plus_screen.dart';
import 'package:example/src/screens/text_plus_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';

import 'button_plus_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextPlus(
          'FlutterPlus Example',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red,
        actions: [
          this._buildInfoButton(),
        ],
      ),
      body: this._buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      padding: EdgeInsets.all(24),
      children: [
        this._buildButton(
          'ContainerPlus',
          Colors.redAccent,
          () {
            navigatorPlus.show(ContainerPlusScreen());
          },
        ),
        this._buildButton(
          'ButtonPlus',
          Colors.redAccent,
          () {
            navigatorPlus.show(ButtonPlusScreen());
          },
        ),
        this._buildButton(
          'TextFieldPlus',
          Colors.redAccent,
          () {
            navigatorPlus.show(TextFieldPlusScreen());
          },
        ),
        this._buildButton(
          'TextPlus',
          Colors.redAccent,
          () {
            navigatorPlus.show(TextPlusScreen());
          },
        ),
        this._buildButton(
          'RichTextPlus',
          Colors.redAccent,
          () {
            navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        Divider(
          color: Colors.black,
        ),
        this._buildButton(
          'NavigatorPlus',
          Colors.blueAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        this._buildButton(
          'BottomSheetPlus',
          Colors.blueAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        this._buildButton(
          'DialogPlus',
          Colors.blueAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        this._buildButton(
          'SnackBarPlus',
          Colors.blueAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        Divider(
          color: Colors.black,
        ),
        this._buildButton(
          'UtilsPlus',
          Colors.greenAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        this._buildButton(
          'ExtensionsPlus',
          Colors.greenAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
        this._buildButton(
          'LocalStoragePlus',
          Colors.greenAccent,
          () {
            // navigatorPlus.show(RichTextPlusScreen());
          },
        ),
      ],
    );
  }

  _buildButton(String title, Color color, Function onPressed) {
    return ButtonPlus(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 50,
      child: TextPlus(
        title,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      color: color,
      onPressed: onPressed,
    );
  }

  _buildInfoButton() {
    return ButtonPlus(
      child: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      onPressed: () {
        print('info_pressed');
      },
    );
  }
}
