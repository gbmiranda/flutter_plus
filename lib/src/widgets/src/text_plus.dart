import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';

class TextPlus extends StatelessWidget {
  // Todo
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

  final double height;
  final double width;
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
  final String fontFamily;

  final TextDecorationPlus textDecorationPlus;
  final List<ShadowPlus> textShadows;

  // ContainePlus
  final Function() onTap;
  final Function() onLongPress;

  final BorderPlus backgroundBorder;
  final List<ShadowPlus> backgroundShadows;
  final List<InnerShadowPlus> backgroundInnerShadows;
  final GradientPlus backgroundGradient;
  final RadiusPlus backgroundRadius;

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
    this.backgroundColor,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontFamily,
    // custom
    this.mask,
    this.isCenter = false,
    this.isExpandend = false,
    this.textDecorationPlus,
    this.textShadows,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.onLongPress,
    this.width,
    this.backgroundBorder,
    this.backgroundShadows,
    this.backgroundInnerShadows,
    this.backgroundGradient,
    this.backgroundRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textPlus = _buildTextPlus();

    if (isCenter == true) {
      _textPlus = Center(
        child: _textPlus,
      );
    }

    if (isExpandend == true) {
      _textPlus = Expanded(
        child: _textPlus,
      );
    }

    return _textPlus;
  }

  Widget _buildTextPlus() {
    return ContainerPlus(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      color: backgroundColor,
      onTap: onTap,
      onLongPress: onLongPress,
      border: backgroundBorder,
      shadows: backgroundShadows,
      innerShadows: backgroundInnerShadows,
      gradient: backgroundGradient,
      radius: backgroundRadius,
      child: Text(
        _maskText,
        key: key,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
        textDirection: textDirection,
        style: textStyle,
      ),
    );
  }

  TextStyle get textStyle {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      backgroundColor: Colors.transparent,
      decoration: textDecorationPlus?.textDecoration,
      decorationColor: textDecorationPlus?.color,
      decorationStyle: textDecorationPlus?.decorationStyle,
      decorationThickness: textDecorationPlus?.decorationThickness,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      wordSpacing: wordSpacing,
      // height: height,
      shadows: _buildShadows(),
    );
  }

  String get _maskText {
    try {
      if (text == null || text.isEmpty) {
        return '';
      } else if (mask == null || mask.isEmpty) {
        return text;
      } else {
        var maskItemCount = 0;
        var maskedString = '';
        for (var i = 0; i < mask.length; i++) {
          if (mask[i] == '#') {
            maskedString += _cleanText[i - maskItemCount];
          } else {
            maskedString += mask[i];
            maskItemCount++;
          }
        }
        return maskedString;
      }
    } on Exception catch (e) {
      print(e);
      return '* invalid mask *';
    }
  }

  String get _cleanText {
    return text.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
  }

  List<Shadow> _buildShadows() {
    if (textShadows == null || textShadows.isEmpty) {
      return null;
    } else {
      return textShadows.map((shadowPlus) {
        return Shadow(
          color: shadowPlus.opacity != null
              ? shadowPlus.color.withOpacity(shadowPlus.opacity)
              : shadowPlus.color,
          blurRadius: shadowPlus.blur,
          offset: Offset(
            shadowPlus.moveRight,
            shadowPlus.moveDown,
          ),
        );
      }).toList();
    }
  }
}
