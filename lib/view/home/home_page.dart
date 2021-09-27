import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/providers.dart';
import 'package:riverpod_todo/view/components/task_list.dart';

class HomePage extends HookWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async => homeViewModel.addTask()
      ),
      body: Center(child: HookBuilder(builder: (context) {
        final snapshot = useFuture(useMemoized(() => homeViewModel.fetchTasks()));
        return snapshot.connectionState == ConnectionState.waiting
            ? const Text("LOADING")
            : TaskList(homeViewModel.tasks);
      }),
      ),
    );
  }
}
