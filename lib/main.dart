import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listnote/screens/note_edit_screen.dart';
import 'package:listnote/screens/note_list_screen.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: const NoteListScreen(),
    routes: <String, WidgetBuilder>{
      NoteEditScreen.routeName: (BuildContext context) =>
          const NoteEditScreen(),
    },
  )));
}
