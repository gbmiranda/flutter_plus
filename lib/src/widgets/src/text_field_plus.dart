import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plus/src/components/src/border_plus.dart';
import 'package:flutter_plus/src/components/src/gradient_plus.dart';
import 'package:flutter_plus/src/components/src/radius_plus.dart';
import 'package:flutter_plus/src/components/src/shadow_plus.dart';
import 'package:flutter_plus/src/components/src/text_decoration_plus.dart';
import 'package:flutter_plus/src/components/src/text_field_mask_plus.dart';
import 'package:flutter_plus/src/widgets/src/text_plus.dart';
import 'container_plus.dart';

class TextFieldPlus extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final double width;
  final Alignment alignment;

  final Color backgroundColor;

  final bool useSkeleton;
  final bool isCenter;
  final bool isExpanded;

  // Plus Package
  final RadiusPlus radius;
  final BorderPlus border;
  final List<ShadowPlus> shadows;
  final GradientPlus gradient;

  //TextField
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;

  final Function(String) onChanged;
  final Function onTap;
  final Function onEditingComplete;
  final Function onSubmitted;

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
  // placeholderStyle: this._buildTextStyle(),

  TextFieldPlus({
    this.enabled,
    this.useSkeleton,
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
    // this.placeholderStyle,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
  });

  static ContainerPlus _containerPlus;

  @override
  Widget build(BuildContext context) {
    return this._buildContainerPlus();
  }

  ContainerPlus _buildContainerPlus() {
    _containerPlus = ContainerPlus(
      padding: this.useSkeleton == true
          ? EdgeInsets.all(0)
          : this.padding ?? EdgeInsets.symmetric(horizontal: 4),
      margin: this.margin,
      isCenter: this.isCenter,
      isExpanded: this.isExpanded,
      alignment: this.alignment,
      color: this.backgroundColor,
      height: this.height,
      width: this.width,
      // skeleton: this.useSkeleton,
      border: this.border,
      gradient: this.gradient,
      radius: this.radius,
      shadows: this.shadows,
      // notifyParent: () => setState(() {}),
      child: this._buildTextField(),
    );
    return _containerPlus;
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      padding: EdgeInsets.all(0),
      autocorrect: this.autocorrect,
      enabled: this.enabled,
      controller: this.controller,
      focusNode: this.focusNode,
      autofocus: this.autofocus,
      textCapitalization: this.textCapitalization,
      keyboardAppearance: Brightness.dark,
      cursorColor: this.cursorColor,
      textAlign: TextAlign.start,
      obscureText: this.obscureText,
      readOnly: this.readOnly,
      textAlignVertical: this.textAlignVertical,
      keyboardType: this.onlyNumbers == true && this.textInputType == null
          ? TextInputType.number
          : this.textInputType,
      maxLines: this.maxLines,
      maxLength: this.maxLength,
      maxLengthEnforced: true,
      showCursor: this.showCursor,
      cursorRadius: Radius.circular(this.cursorRadius),
      cursorWidth: this.cursorWidth,
      placeholder: this.placeholder?.text,
      placeholderStyle: this._buildPlaceholderTextStyle(),
      style: this._buildTextStyle(),
      inputFormatters: this._getFormatters(),
      prefix: this.prefixWidget,
      suffix: this.suffixWidget,
      onChanged: this.onChanged,
      onTap: this.onTap,
      onEditingComplete: this.onEditingComplete,
      onSubmitted: this.onSubmitted,
      textInputAction: this.textInputAction,

      // remove native decoration
      decoration: null,
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      backgroundColor: Colors.transparent,
      color: this.textColor,
      fontSize: this.fontSize,
      fontWeight: this.fontWeight,
      fontStyle: this.fontStyle,
      decoration: this.textDecorationX?.textDecoration,
      decorationColor: this.textDecorationX?.color,
      decorationStyle: this.textDecorationX?.decorationStyle,
      decorationThickness: this.textDecorationX?.decorationThickness,
      letterSpacing: this.letterSpacing,
      fontFamily: this.fontFamily,
      wordSpacing: this.wordSpacing,
    );
  }

  TextStyle _buildPlaceholderTextStyle() {
    if (this.placeholder == null) return null;
    return TextStyle(
      backgroundColor: this.placeholder.backgroundColor,
      color: this.placeholder.color,
      fontSize: this.placeholder.fontSize,
      fontWeight: this.placeholder.fontWeight,
      fontStyle: this.placeholder.fontStyle,
      decoration: this.placeholder.textDecorationPlus?.textDecoration,
      decorationColor: this.placeholder.textDecorationPlus?.color,
      decorationStyle: this.placeholder.textDecorationPlus?.decorationStyle,
      decorationThickness:
          this.placeholder.textDecorationPlus?.decorationThickness,
      letterSpacing: this.placeholder.letterSpacing,
      fontFamily: this.placeholder.fontFamily,
      wordSpacing: this.placeholder.wordSpacing,
      height: this.placeholder.height,
    );
  }

  List<TextInputFormatter> _getFormatters() {
    print('_getFormatters');

    List<TextInputFormatter> textInputFormatters = [];
    if (this.maxLength != null) {
      //   var maxLengthFormatter = LengthLimitingTextInputFormatter(this.maxLength);
      //   textInputFormatters.add(maxLengthFormatter);
      textInputFormatters.add(MaxLengthTextInputFormatter(this.maxLength));
    }

    if (this.mask != null) {
      var maskFormatter = new TextFieldMaskPlus(
          mask: this.mask, filter: {"#": RegExp(r'[0-9]')});
      textInputFormatters.add(maskFormatter);
    }

    if (this.onlyNumbers == true) {
      // textInputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
      textInputFormatters.add(FilteringTextInputFormatter.digitsOnly);
      // textInputFormatters.add(DecimalTextInputFormatter());
    }

    return textInputFormatters;
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

// class DecimalTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final regEx = RegExp(r"^\d*\.?\d*");
//     String newString = regEx.stringMatch(newValue.text) ?? "";
//     return newString == newValue.text ? newValue : oldValue;
//   }
// }
