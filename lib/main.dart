import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: MyHome());
}

class MyHome extends HookWidget {
  const MyHome({Key? key}) : super(key: key);

  final String title = 'ListNote';

  @override
  Widget build(BuildContext context) {
    final int count = useProvider(counterProvider).state;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
