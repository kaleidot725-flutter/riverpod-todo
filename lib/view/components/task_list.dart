import 'package:flutter/material.dart';
import 'package:riverpod_todo/model/entity/task.dart';
import 'package:riverpod_todo/view/components/task_card.dart';
import 'package:riverpod_todo/view/components/task_field.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks);

  final List<Task> _tasks;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(_tasks[index]);
            },
          ),
        ),
      ),
      Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [TaskField()],
        ),
      )
    ]);
  }
}
