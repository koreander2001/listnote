import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listnote/pages/note_list_page.dart';

final noteListProvider = StateProvider((ref) => [
      'メッセージ1',
      'メッセージ2',
      'メッセージ3',
      'メッセージ4',
      'メッセージ5',
    ]);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: NoteListPage());
}
