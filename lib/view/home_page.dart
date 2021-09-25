import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/providers.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      body: Center(child: HookBuilder(builder: (context) {
        final homeViewModel = useProvider(homeViewModelProvider);
        final snapshot =
            useFuture(useMemoized(() => homeViewModel.fetchTasks()));
        return snapshot.connectionState == ConnectionState.waiting
            ? const Text("LOADING")
            : ListView.builder(
                itemCount: homeViewModel.tasks.length,
                itemBuilder: (_, index) {
                  return Text(homeViewModel.tasks[index].name);
                },
              );
      })),
    );
  }
}
