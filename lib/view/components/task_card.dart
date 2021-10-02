import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo/model/entity/task.dart';

typedef CheckTask = void Function(Task task);
typedef DeleteTask = void Function(Task task);

class TaskCard extends StatelessWidget {
  TaskCard(this._task, this._checkTask, this._deleteTask);

  final Task _task;

  final CheckTask _checkTask;

  final DeleteTask _deleteTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: Text(_task.name)),
            IconButton(
                onPressed: () {
                  _deleteTask(_task);
                },
                icon: Icon(
                  Icons.delete_forever_outlined
                )),
            Checkbox(
              value: _task.isChecked,
              onChanged: (isChecked) {
                _checkTask(_task);
              },
            ),
          ],
        ),
      ),
    );
  }
}
