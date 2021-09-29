import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listnote/screens/note_edit_screen.dart';

final noteListProvider = StateProvider((ref) => [
      'メッセージ1',
      'メッセージ2',
      'メッセージ3',
      'メッセージ4',
      'メッセージ5',
    ]);

class NoteListScreen extends HookWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    final noteList = useProvider(noteListProvider).state;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
            children: noteList
                .map((message) => _messageItem(context, message))
                .toList()),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openEditScreen(context, null),
        ),
      ),
    );
  }

  Widget _messageItem(BuildContext context, String message) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      ),
      child: ListTile(
        title: Text(
          message,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () => _openEditScreen(context, message),
      ),
    );
  }

  void _openEditScreen(BuildContext context, String? message) {
    Navigator.pushNamed(context, NoteEditScreen.routeName, arguments: message);
  }
}
