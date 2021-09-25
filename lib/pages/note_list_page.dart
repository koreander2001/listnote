import 'package:flutter/material.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    var list = [
      'メッセージ1',
      'メッセージ2',
      'メッセージ3',
      'メッセージ4',
      'メッセージ5',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(children: list.map(_messageItem).toList()),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    ));
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: null,
      ),
    );
  }
}
