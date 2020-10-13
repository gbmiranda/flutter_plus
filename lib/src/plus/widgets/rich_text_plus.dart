import 'package:flutter/material.dart';
import 'package:flutter_plus/src/plus/widgets/text_plus.dart';

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
    Widget TextPlus = this._buildRichTextPlus();

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

  Widget _buildRichTextPlus() {
    return RichText(
      key: this.key,
      text: TextSpan(
        text: '',
        children: this
            .texts
            .map(
              (TextPlus) => TextSpan(
                text: TextPlus.text,
                style: TextPlus.textStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}
