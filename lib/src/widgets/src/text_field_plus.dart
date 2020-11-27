import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../flutter_plus.dart';

class TextFieldPlus extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final double width;
  final Alignment alignment;

  final Color backgroundColor;

  final bool isCenter;
  final bool isExpanded;

  // Plus Package
  final RadiusPlus radius;
  final BorderPlus border;
  final List<ShadowPlus> shadows;
  final GradientPlus gradient;
  final SkeletonPlus skeleton;

  //TextField
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;

  final Function(String) onChanged;
  final Function() onTap;
  final Function() onEditingComplete;
  final Function(String) onSubmitted;

  final String mask;

  final TextPlus placeholder;

  final TextInputAction textInputAction;

  final Color cursorColor;

  final int maxLength;
  final int maxLines;
  final double cursorRadius;
  final double cursorWidth;

  final bool enabled;
  final bool autocorrect;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final bool showCursor;
  final bool onlyNumbers;

  // style
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double letterSpacing;
  final double wordSpacing;
  final String fontFamily;
  final TextDecorationPlus textDecorationX;

  final Widget prefixWidget;
  final Widget suffixWidget;
  // placeholderStyle: _buildTextStyle(),

  TextFieldPlus({
    this.enabled,
    this.isCenter = false,
    this.isExpanded = false,
    this.padding,
    this.margin,
    this.height = 50,
    this.width,
    this.radius,
    this.border,
    this.shadows,
    this.gradient,
    this.skeleton,
    this.alignment,
    this.backgroundColor,
    this.controller,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.mask,
    this.maxLength,
    this.maxLines,
    this.autocorrect = false,
    this.autofocus = false,
    this.obscureText = false,
    this.onlyNumbers = false,
    this.focusNode,
    this.onChanged,
    this.readOnly = false,
    this.cursorColor,
    this.textAlignVertical = TextAlignVertical.center,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.textDecorationX,
    this.placeholder,
    this.cursorRadius = 2,
    this.cursorWidth = 2,
    this.showCursor = true,
    this.prefixWidget,
    this.suffixWidget,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
  });

  static ContainerPlus _containerPlus;

  @override
  Widget build(BuildContext context) {
    return _buildContainerPlus();
  }

  ContainerPlus _buildContainerPlus() {
    _containerPlus = ContainerPlus(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4),
      margin: margin,
      isCenter: isCenter,
      isExpanded: isExpanded,
      alignment: alignment,
      color: backgroundColor,
      height: height,
      width: width,
      skeleton: skeleton,
      border: border,
      gradient: gradient,
      radius: radius,
      shadows: shadows,
      // notifyParent: () => setState(() {}),
      child: _buildTextField(),
    );
    return _containerPlus;
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 4),
      autocorrect: autocorrect,
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      keyboardAppearance: Brightness.dark,
      cursorColor: cursorColor,
      textAlign: TextAlign.start,
      obscureText: obscureText,
      readOnly: readOnly,
      textAlignVertical: textAlignVertical,
      keyboardType: onlyNumbers == true && textInputType == null
          ? TextInputType.number
          : textInputType,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforced: true,
      showCursor: showCursor,
      cursorRadius: Radius.circular(cursorRadius),
      cursorWidth: cursorWidth,
      placeholder: placeholder?.text,
      placeholderStyle: _buildPlaceholderTextStyle(),
      style: _buildTextStyle(),
      inputFormatters: _getFormatters(),
      prefix: prefixWidget,
      suffix: suffixWidget,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,

      // remove native decoration
      decoration: null,
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      backgroundColor: Colors.transparent,
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: textDecorationX?.textDecoration,
      decorationColor: textDecorationX?.color,
      decorationStyle: textDecorationX?.decorationStyle,
      decorationThickness: textDecorationX?.decorationThickness,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      wordSpacing: wordSpacing,
    );
  }

  TextStyle _buildPlaceholderTextStyle() {
    if (placeholder == null) return null;
    return TextStyle(
      backgroundColor: placeholder.backgroundColor,
      color: placeholder.color,
      fontSize: placeholder.fontSize,
      fontWeight: placeholder.fontWeight,
      fontStyle: placeholder.fontStyle,
      decoration: placeholder.textDecorationPlus?.textDecoration,
      decorationColor: placeholder.textDecorationPlus?.color,
      decorationStyle: placeholder.textDecorationPlus?.decorationStyle,
      decorationThickness: placeholder.textDecorationPlus?.decorationThickness,
      letterSpacing: placeholder.letterSpacing,
      fontFamily: placeholder.fontFamily,
      wordSpacing: placeholder.wordSpacing,
      height: placeholder.height,
    );
  }

  List<TextInputFormatter> _getFormatters() {
    var textInputFormatters = [];
    if (maxLength != null) {
      //   var maxLengthFormatter = LengthLimitingTextInputFormatter(maxLength);
      //   textInputFormatters.add(wmaxLengthFormatter);
      textInputFormatters.add(MaxLengthTextInputFormatter(maxLength));
    }

    if (mask != null) {
      var maskFormatter =
          TextFieldMaskPlus(mask: mask, filter: {"#": RegExp(r'[0-9]')});
      textInputFormatters.add(maskFormatter);
    }

    if (onlyNumbers == true) {
      // textInputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
      textInputFormatters.add(FilteringTextInputFormatter.digitsOnly);
      // textInputFormatters.add(DecimalTextInputFormatter());
    }

    return textInputFormatters.map((e) => e as TextInputFormatter).toList();
  }
}

class MaxLengthTextInputFormatter extends TextInputFormatter {
  final int maxLength;

  MaxLengthTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) {
      return oldValue;
    } else {
      return newValue;
    }
  }
}
