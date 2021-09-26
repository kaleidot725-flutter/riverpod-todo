import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/providers.dart';
import 'package:riverpod_todo/view/home/home_page.dart';
import 'package:riverpod_todo/view/initialize/initialize_page.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: MyApp())));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appDatabase = useProvider(appDatabaseProvider);
    final snapshot = useFuture(useMemoized(() => appDatabase.open()));
    return snapshot.connectionState == ConnectionState.waiting
        ? InitializePage()
        : HomePage();
  }
}
