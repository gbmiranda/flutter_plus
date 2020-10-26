import 'package:flutter/material.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/components/src/text_decoration_plus.dart';

class TextPlus extends StatelessWidget {
  // Todo
  // padding
  // urls
  // phones

  // dates
  // onTap

  // atributos
  final String text;
  final int maxLines;
  final String mask;
  final bool isCenter;
  final bool isExpandend;
  final bool isCleanText; // fazer

  final EdgeInsets padding;
  final EdgeInsets margin;

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

  final TextDecorationPlus textDecorationPlus;
  final List<ShadowPlus> shadows;

  // gesture
  final Function onTap;
  final Function(TapDownDetails) onTapDown;
  final Function(TapUpDetails) onTapUp;
  final Function onTapCancel;
  final Function onDoubleTap;
  final Function onLongPress;

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
    this.textDecorationPlus,
    this.shadows,
    this.padding,
    this.margin,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _textPlus = this._buildTextPlus();

    if (this.isCenter == true) {
      _textPlus = Center(
        child: _textPlus,
      );
    }

    if (this.isExpandend == true) {
      _textPlus = Expanded(
        child: _textPlus,
      );
    }

    if (this.hasGestureDetector) {
      _textPlus = this._buildGestureDetector(_textPlus);
    }

    return _textPlus;
  }

  Widget _buildTextPlus() {
    return Container(
      padding: this.padding,
      margin: this.margin,
      child: Text(
        this._maskText,
        key: this.key,
        maxLines: this.maxLines,
        overflow: this.textOverflow,
        textAlign: this.textAlign,
        textDirection: this.textDirection,
        style: this.textStyle,
      ),
    );
  }

  _buildGestureDetector(Widget child) {
    return GestureDetector(
      onTap: this.onTap ?? null,
      onDoubleTap: this.onDoubleTap ?? null,
      onLongPress: this.onLongPress ?? null,
      onTapDown: this.onTapDown ?? null,
      onTapUp: this.onTapUp ?? null,
      onTapCancel: this.onTapCancel ?? null,
      child: child,
    );
  }

  bool get hasGestureDetector {
    if (this.onTap != null ||
        this.onDoubleTap != null ||
        this.onLongPress != null ||
        this.onTapDown != null ||
        this.onTapUp != null ||
        this.onTapCancel != null)
      return true;
    else
      return false;
  }

  TextStyle get textStyle {
    return TextStyle(
      color: this.color,
      fontSize: this.fontSize,
      fontWeight: this.fontWeight,
      fontStyle: this.fontStyle,
      backgroundColor: this.backgroundColor,
      decoration: this.textDecorationPlus?.textDecoration,
      decorationColor: this.textDecorationPlus?.color,
      decorationStyle: this.textDecorationPlus?.decorationStyle,
      decorationThickness: this.textDecorationPlus?.decorationThickness,
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
      return this.shadows.map((shadowPlus) {
        return Shadow(
          color: shadowPlus.color.withOpacity(shadowPlus.opacity),
          blurRadius: shadowPlus.blur,
          offset: Offset(
            shadowPlus.moveRight,
            shadowPlus.moveDown,
          ),
        );
      }).toList();
  }
}
