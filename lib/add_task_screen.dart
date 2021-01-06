import 'package:flutter/material.dart';
import 'package:todo_mgr/task.dart';
import 'package:todo_mgr/tasks_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskProvider _taskProvider;

  AddTaskScreen(this._taskProvider);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "ADD TASK",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, color: Colors.red),
              ),
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  String _name = _controller.text;
                  bool _isChecked = false;
                  DateTime _dateTime = DateTime.now();
                  if (_name.trim().isNotEmpty) {
                    Task _task = Task(_name, _isChecked, _dateTime);
                    _taskProvider.add(_task);
                    Navigator.pop(context);
                  } else {
                    print("empty text");
                  }
                },
                controller: _controller,
                autofocus: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(),
              ),
              FlatButton(
                onPressed: () {
                  String _name = _controller.text;
                  bool _isChecked = false;
                  DateTime _dateTime = DateTime.now();
                  if (_name.trim().isNotEmpty) {
                    Task _task = Task(_name, _isChecked, _dateTime);
                    _taskProvider.add(_task);
                    Navigator.pop(context);
                  } else {
                    print("empty text");
                  }
                },
                child: Text("Add"),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
