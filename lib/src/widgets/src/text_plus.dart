import 'package:flutter/material.dart';
import 'package:flutter_plus/plus.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/components/src/text_decoration_plus.dart';
import 'package:flutter_plus/src/widgets/src/container_plus.dart';

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
  final Function onTap;
  final Function onLongPress;

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

    return _textPlus;
  }

  Widget _buildTextPlus() {
    return ContainerPlus(
      width: this.width,
      height: this.height,
      padding: this.padding,
      margin: this.margin,
      color: this.backgroundColor,
      onTap: this.onTap,
      onLongPress: this.onLongPress,
      border: this.backgroundBorder,
      shadows: this.backgroundShadows,
      innerShadows: this.backgroundInnerShadows,
      gradient: this.backgroundGradient,
      radius: this.backgroundRadius,
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

  // _buildGestureDetector(Widget child) {
  //   return GestureDetector(
  //     onTap: this.onTap ?? null,
  //     onLongPress: this.onLongPress ?? null,
  //     child: child,
  //     behavior: HitTestBehavior.translucent,
  //   );
  // }

  // bool get hasGestureDetector {
  //   if (this.onTap != null || this.onLongPress != null)
  //     return true;
  //   else
  //     return false;
  // }

  TextStyle get textStyle {
    return TextStyle(
      color: this.color,
      fontSize: this.fontSize,
      fontWeight: this.fontWeight,
      fontStyle: this.fontStyle,
      backgroundColor: Colors.transparent,
      decoration: this.textDecorationPlus?.textDecoration,
      decorationColor: this.textDecorationPlus?.color,
      decorationStyle: this.textDecorationPlus?.decorationStyle,
      decorationThickness: this.textDecorationPlus?.decorationThickness,
      letterSpacing: this.letterSpacing,
      fontFamily: this.fontFamily,
      wordSpacing: this.wordSpacing,
      // height: this.height,
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
    if (this.textShadows == null || this.textShadows.isEmpty)
      return null;
    else
      return this.textShadows.map((shadowPlus) {
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
