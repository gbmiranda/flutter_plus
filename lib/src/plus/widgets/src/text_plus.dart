import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/plus/components/src/text_decoration_plus.dart';

class TextPlus extends StatelessWidget {
  // Todo
  // padding
  // urls
  // phones
  // dates

  // atributos
  final String text;
  final int maxLines;
  final String mask;
  final bool isCenter;
  final bool isExpandend;
  final bool isCleanText; // fazer

  // style
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color backgroundColor;
  final double letterSpacing;
  final double wordSpacing;
  final double height;
  final String fontFamily;

  final TextDecorationPlus textDecorationX;
  final List<ShadowPlus> shadows;

  TextPlus(
    this.text, {
    Key key,
    this.maxLines,
    this.textOverflow,
    this.textAlign = TextAlign.left,
    this.textDirection = TextDirection.ltr,
    // style
    this.color = Colors.black,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.backgroundColor = Colors.transparent,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontFamily,
    // custom
    this.mask,
    this.isCenter = false,
    this.isExpandend = false,
    this.isCleanText,
    this.textDecorationX,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget TextPlus = this._buildTextPlus();

    if (this.isCenter == true)
      TextPlus = Center(
        child: TextPlus,
      );

    if (this.isExpandend == true)
      TextPlus = Expanded(
        child: TextPlus,
      );

    return TextPlus;
  }

  Widget _buildTextPlus() {
    return Text(
      this._maskText,
      key: this.key,
      maxLines: this.maxLines,
      overflow: this.textOverflow,
      textAlign: this.textAlign,
      textDirection: this.textDirection,
      style: this.textStyle,
    );
  }

  TextStyle get textStyle {
    return TextStyle(
      color: this.color,
      fontSize: this.fontSize,
      fontWeight: this.fontWeight,
      fontStyle: this.fontStyle,
      backgroundColor: this.backgroundColor,
      decoration: this.textDecorationX?.textDecoration,
      decorationColor: this.textDecorationX?.color,
      decorationStyle: this.textDecorationX?.decorationStyle,
      decorationThickness: this.textDecorationX?.decorationThickness,
      letterSpacing: this.letterSpacing,
      fontFamily: this.fontFamily,
      wordSpacing: this.wordSpacing,
      height: this.height,
      shadows: this._buildShadows(),
    );
  }

  String get _maskText {
    try {
      if (this.text == null || this.text.isEmpty)
        return '';
      else if (this.mask == null || this.mask.isEmpty)
        return this.text;
      else {
        int maskItemCount = 0;
        String maskedString = '';
        for (var i = 0; i < mask.length; i++) {
          if (mask[i] == '#')
            maskedString += this._cleanText[i - maskItemCount];
          else {
            maskedString += mask[i];
            maskItemCount++;
          }
        }
        return maskedString;
      }
    } catch (e) {
      print(e);
      return '* invalid mask *';
    }
  }

  String get _cleanText {
    return this
        .text
        .replaceAll(new RegExp(r'[^\w\s]+'), '')
        .replaceAll(' ', '');
  }

  _buildShadows() {
    if (this.shadows == null || this.shadows.isEmpty)
      return null;
    else
      return this.shadows.map((XShadow) {
        return Shadow(
          color: XShadow.color.withOpacity(XShadow.opacity),
          blurRadius: XShadow.blur,
          offset: Offset(
            XShadow.moveRight,
            XShadow.moveDown,
          ),
        );
      }).toList();
  }
}
