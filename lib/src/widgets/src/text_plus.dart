import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';

class TextPlus extends StatelessWidget {
  /*
    Todo
    urls
    phones
    dates
    onTap
  */

  /// TextPlus text
  final String text;

  /// TextPlus maxLines
  final int maxLines;

  /// TextPlus mask -> ###.###.###-##
  final String mask;

  /// TextPlus inside Center widget
  final bool isCenter;

  /// TextPlus inside Expanded widget
  final bool isExpanded;

  /// TextPlus height
  final double height;

  /// TextPlus width
  final double width;

  /// TextPlus padding
  final EdgeInsets padding;

  /// TextPlus margin
  final EdgeInsets margin;

  /// TextPlus textOverflow
  final TextOverflow textOverflow;

  /// TextPlus textAlign
  final TextAlign textAlign;

  /// TextPlus textDirection
  final TextDirection textDirection;

  /// TextPlus color
  final Color color;

  /// TextPlus fontSize
  final double fontSize;

  /// TextPlus fontWeight
  final FontWeight fontWeight;

  /// TextPlus fontStyle
  final FontStyle fontStyle;

  /// TextPlus backgroundColor
  final Color backgroundColor;

  /// TextPlus letterSpacing
  final double letterSpacing;

  /// TextPlus wordSpacing
  final double wordSpacing;

  /// TextPlus fontFamily
  final String fontFamily;

  /// TextPlus textDecorationPlus
  final TextDecorationPlus textDecorationPlus;

  /// TextPlus textShadows
  final List<ShadowPlus> textShadows;

  /// TextPlus radius
  final RadiusPlus backgroundRadius;

  /// TextPlus border
  final BorderPlus backgroundBorder;

  /// TextPlus shadows
  final List<ShadowPlus> backgroundShadows;

  /// TextPlus gradient
  final GradientPlus backgroundGradient;

  /// TextPlus innerShadows
  final List<InnerShadowPlus> backgroundInnerShadows;

  /// TextPlus onTap action
  final Function() onTap;

  /// TextPlus onLongPress action
  final Function() onLongPress;

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
    this.isExpanded = false,
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

    if (isExpanded == true) {
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
