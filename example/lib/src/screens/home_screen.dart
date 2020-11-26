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

  _teste() {
    BorderPlus(
      color: Colors.black,
      style: BorderStyle.solid,
      width: 2.0,
    );

    GradientPlus.linear(
      colors: [Colors.black, Colors.white],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.2, 0.8],
    );

    GradientPlus.radial(
      colors: [Colors.black, Colors.white],
      center: Alignment.centerLeft,
      focal: Alignment.bottomCenter,
      focalRadius: 1.5,
      radius: 4.5,
      stops: [0.3, 0.7],
    );

    GradientPlus.sweep(
      colors: [Colors.black, Colors.white],
      center: Alignment.centerLeft,
      startAngle: 1.5,
      endAngle: 3.2,
      stops: [0.5, 0.8],
    );

    InnerShadowPlus(
      color: Colors.red,
      blur: 10.0,
      moveDown: 4.5,
      moveRight: 2.5,
      opacity: 0.5,
    );

    ShadowPlus(
      color: Colors.red,
      blur: 10.0,
      spread: 2.5,
      moveDown: 4.5,
      moveRight: 2.5,
      opacity: 0.5,
    );

    RadiusPlus.all(12.0);

    RadiusPlus.bottom(12.0);

    RadiusPlus.only(
      topLeft: 12.0,
      topRight: 12.0,
      bottomLeft: 8.0,
      bottomRight: 8.0,
    );

    RadiusPlus.top(12.0);

    SkeletonPlus.custom(
      enabled: true,
      baseColor: Colors.black87,
      highlightColor: Colors.black26,
      duration: Duration(
        milliseconds: 500,
      ),
      showBorders: false,
      showShadows: false,
    );

    TextDecorationPlus(
      color: Colors.red,
      decorationStyle: TextDecorationStyle.dashed,
      decorationThickness: 0.5,
    );
  }
}
