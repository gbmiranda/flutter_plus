import 'package:flutter/material.dart';

import '../../../flutter_plus.dart';

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
    var richTextPlus = _buildRichTextPlus();

    if (isCenter == true) {
      richTextPlus = Center(
        child: richTextPlus,
      );
    }

    if (isExpandend == true) {
      richTextPlus = Expanded(
        child: richTextPlus,
      );
    }
    return richTextPlus;
  }

  Widget _buildRichTextPlus() {
    return RichText(
      key: key,
      text: TextSpan(
        text: '',
        children: texts
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
