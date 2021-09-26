import 'package:flutter/material.dart';
import 'package:riverpod_todo/model/entity/task.dart';

class TaskList extends StatelessWidget {
  TaskList(this._tasks);

  final List<Task> _tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return Card(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        child: Text(_tasks[index].name)),
                    Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Checkbox(
                            value: _tasks[index].isChecked,
                            onChanged: (isChecked) {}))
                  ],
                )));
      },
    );
  }
}
