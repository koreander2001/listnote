import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listnote/main.dart';

class NoteListPage extends HookWidget {
  const NoteListPage({Key? key}) : super(key: key);

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    final noteList = useProvider(noteListProvider).state;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(children: noteList.map(_messageItem).toList()),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Fluttertoast.showToast(msg: 'Add button'),
        ),
      ),
    );
  }

  Widget _messageItem(String message) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      ),
      child: ListTile(
        title: Text(
          message,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () => Fluttertoast.showToast(msg: message),
      ),
    );
  }
}
