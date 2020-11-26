import 'package:example/src/screens/compare_widget_screen.dart';
import 'package:example/src/screens/container_plus_screen.dart';
import 'package:example/src/screens/navigator_plus_screen.dart';
import 'package:example/src/screens/rich_text_plus_screen.dart';
import 'package:example/src/screens/text_field_plus_screen.dart';
import 'package:example/src/screens/text_plus_screen.dart';
import 'package:example/src/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _buildInfoButton() {
    return ButtonPlus(
      child: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      onPressed: () {
        dialogPlus.showDefault(
          title: 'FlutterPlus',
          message: 'Developed by Gabriel Braga.',
          buttonOneText: 'OK',
          buttonOneColor: Colors.black,
          buttonOneCallback: () {
            navigatorPlus.back();
          },
        );
      },
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
        Row(
          children: [
            Expanded(
              child: this._buildButton(
                'NavigatorPlus:\nshowModal()',
                Colors.blueAccent,
                () {
                  navigatorPlus.showModal(NavigatorPlusScreen());
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: this._buildButton(
                'NavigatorPlus:\nshow()',
                Colors.blueAccent,
                () {
                  navigatorPlus.show(NavigatorPlusScreen());
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: this._buildButton(
                'SnackBarPlus:\nshowText()',
                Colors.blueAccent,
                () {
                  snackBarPlus.showText(
                    'FlutterPlus',
                    textColor: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.green,
                  );
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: this._buildButton(
                'SnackBarPlus:\nshow()',
                Colors.blueAccent,
                () {
                  snackBarPlus.show(
                    backgroundColor: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        TextPlus(
                          'FlutterPlus!',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: this._buildButton(
                'DialogPlus:\nshowDefault()',
                Colors.blueAccent,
                () {
                  const url = 'https://github.com/gbmiranda/flutter_plus';
                  dialogPlus.showDefault(
                    title: 'FlutterPlus',
                    message: url,
                    elementsSpacing: 16,
                    buttonOneText: 'Close',
                    buttonOneColor: Colors.red,
                    buttonOneCallback: () {
                      navigatorPlus.back();
                    },
                    buttonTwoText: 'Open',
                    buttonTwoCallback: () async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('Could not launch $url');
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: this._buildButton(
                'DialogPlus:\nshow()',
                Colors.blueAccent,
                () {
                  dialogPlus.show(
                    child: CustomWidget(),
                    radius: RadiusPlus.all(20),
                    closeKeyboardWhenOpen: true,
                  );
                },
              ),
            )
          ],
        ),
        this._buildButton(
          'BottomSheetPlus',
          Colors.blueAccent,
          () {
            bottomSheetPlus.show(
              child: CustomWidget(),
              radius: RadiusPlus.top(20),
              heightPercentScreen: 0.3,
            );
          },
        ),
        Divider(
          color: Colors.black,
        ),
        this._buildButton(
          'Compare Widgets',
          Colors.orange,
          () {
            navigatorPlus.show(CompareWidgetScreen());
          },
        ),
        this._buildButton(
          'Open complete documentation',
          Colors.green,
          () {
            this._openDocSite();
          },
        ),
      ],
    );
  }

  _openDocSite() async {
    const url =
        'https://github.com/gbmiranda/flutter_plus/blob/master/README.md';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  _buildButton(String title, Color color, Function onPressed) {
    return ButtonPlus(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      radius: RadiusPlus.all(8),
      height: 50,
      child: TextPlus(
        title,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
      color: color,
      onPressed: onPressed,
    );
  }

  _atributos() {
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
