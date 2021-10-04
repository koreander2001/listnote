import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:listnote/data_classes/text_item.dart';

class ItemizedTexts extends StatelessWidget {
  final List<TextItem> textItems;
  final TextStyle? textStyle;
  late final textFieldControllers = textItems.map((item) {
    return TextEditingController(text: item.text);
  }).toList();

  ItemizedTexts(this.textItems, {this.textStyle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: IterableZip([textItems, textFieldControllers]).map((values) {
        final item = values[0] as TextItem;
        final controller = values[1] as TextEditingController;
        return _ItemizedTextRow(controller, item.depth, textStyle: textStyle);
      }).toList(),
    );
  }
}

class _ItemizedTextRow extends StatelessWidget {
  final TextEditingController textFieldController;
  final int depth;
  final TextStyle? textStyle;

  const _ItemizedTextRow(
    this.textFieldController,
    this.depth, {
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0 * depth, bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Text('● ', style: textStyle),
          Expanded(
              child:
                  TextField(controller: textFieldController, style: textStyle)),
        ],
      ),
    );
  }
}
