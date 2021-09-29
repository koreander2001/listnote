import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoteEditScreen extends HookWidget {
  const NoteEditScreen({Key? key}) : super(key: key);

  static const routeName = '/edit';

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    final noteTitle = ModalRoute.of(context)!.settings.arguments as String?;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Column(
            children: [
              Text(noteTitle ?? 'New note'),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Return'),
              ),
            ],
          )),
    );
  }
}
