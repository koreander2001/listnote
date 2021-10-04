import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:listnote/data_classes/text_item.dart';
import 'package:listnote/widgets/itemized_texts.dart';

class NoteEditScreen extends HookWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  static const routeName = '/edit';

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    final noteTitle = ModalRoute.of(context)!.settings.arguments as String?;
    final titleController = TextEditingController(text: noteTitle);

    final textItems = [
      const TextItem('4項目目', 3),
      const TextItem('1項目目', 0),
      const TextItem('2項目目', 1),
      const TextItem('3項目目', 2),
      const TextItem('4項目目', 3),
      const TextItem('5項目目', 4),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: titleController,
                style: const TextStyle(fontSize: 24.0),
                enabled: true,
                obscureText: false,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ItemizedTexts(textItems),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
