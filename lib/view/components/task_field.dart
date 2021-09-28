import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

typedef AddTask = void Function();
typedef InputTaskName = void Function(String);

class TaskField extends StatelessWidget {
  TaskField(this._addTask, this._taskName, this._inputTaskName);

  final AddTask _addTask;

  final String _taskName;
  final InputTaskName _inputTaskName;

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: _taskName);

    return Container(
      color: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: controller,
                onChanged: (String s) => _inputTaskName(s),
              ),
            ),
            IconButton(
              onPressed: () {
                _addTask();
                controller.clear();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
