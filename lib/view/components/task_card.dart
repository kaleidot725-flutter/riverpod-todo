import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todo/model/entity/task.dart';

class TaskCard extends StatelessWidget {
  TaskCard(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(_task.name)),
            Container(
                height: 40,
                alignment: Alignment.centerRight,
                child:
                    Checkbox(value: _task.isChecked, onChanged: (isChecked) {}))
          ],
        ),
      ),
    );
  }
}
