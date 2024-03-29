import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

typedef AddTask = void Function();
typedef InputTaskName = void Function(String);

final TextEditingController _controller = new TextEditingController();

class TaskField extends StatelessWidget {
  TaskField(this._addTask, this._inputTaskName);

  final AddTask _addTask;
  final InputTaskName _inputTaskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Input Task Name."
                ),
                controller: _controller,
                onChanged: (String s) => _inputTaskName(s),
              ),
            ),
            IconButton(
              onPressed: () {
                _addTask();
                _inputTaskName("");
                _controller.clear();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
