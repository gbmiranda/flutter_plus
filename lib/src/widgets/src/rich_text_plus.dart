import 'package:flutter/material.dart';
import 'package:flutter_plus/src/widgets/src/text_plus.dart';

class RichTextPlus extends StatelessWidget {
  // TODO
  // urls
  // phones
  // dates

  // atributos
  final int maxLines;
  final bool isCenter;
  final bool isExpandend;

  final List<TextPlus> texts;

  RichTextPlus({
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
    Widget richTextPlus = this._buildRichTextPlus();

    if (this.isCenter == true)
      richTextPlus = Center(
        child: richTextPlus,
      );

    if (this.isExpandend == true)
      richTextPlus = Expanded(
        child: richTextPlus,
      );

    return richTextPlus;
  }

  Widget _buildRichTextPlus() {
    return RichText(
      key: this.key,
      text: TextSpan(
        text: '',
        children: this
            .texts
            .map(
              (richTextPlus) => TextSpan(
                text: richTextPlus.text,
                style: richTextPlus.textStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}
