import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/entity/task.dart';
import 'package:riverpod_todo/providers.dart';
import 'package:riverpod_todo/view/components/loading.dart';
import 'package:riverpod_todo/view/components/task_list.dart';

class HomePage extends HookWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      body: Center(
        child: HookBuilder(builder: (context) {
          final snapshot = useFuture(
            useMemoized(() => homeViewModel.fetchTasks()),
          );
          var waiting = snapshot.connectionState == ConnectionState.waiting;
          return waiting
              ? Loading()
              : TaskList(
                  homeViewModel.tasks,
                  () => homeViewModel.addTask(),
                  (String input) => homeViewModel.inputTaskName(input),
                  (Task task) => homeViewModel.checkTask(task),
                  (Task task) => homeViewModel.deleteTask(task)
                );
        }),
      ),
    );
  }
}
