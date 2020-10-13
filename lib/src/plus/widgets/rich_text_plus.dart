import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/widgets/text_plus.dart';

class RichTextX extends StatelessWidget {
  // TODO
  // urls
  // phones
  // dates

  // atributos
  final int maxLines;
  final bool isCenter;
  final bool isExpandend;

  final List<TextPlus> texts;

  RichTextX({
    Key key,
    this.maxLines = 1,
    // custom
    this.isCenter = false,
    this.isExpandend = false,
    this.texts,
    // this.mainTextStyleX,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textX = this._buildRichTextX();

    if (this.isCenter == true)
      textX = Center(
        child: textX,
      );

    if (this.isExpandend == true)
      textX = Expanded(
        child: textX,
      );

    return textX;
  }

  Widget _buildRichTextX() {
    return RichText(
      key: this.key,
      text: TextSpan(
        text: '',
        children: this
            .texts
            .map(
              (textX) => TextSpan(
                text: textX.text,
                style: textX.textStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}
