import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mgr/add_task_screen.dart';
import 'package:todo_mgr/task.dart';
import 'package:todo_mgr/tasks_provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskProvider _taskProvider = Provider.of<TaskProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(_taskProvider));
          },
        ),
        body: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      tooltip: "Delete all finished tasks",
                      iconSize: 30,
                      color: Colors.white,
                      icon: Icon(Icons.delete_sweep),
                      onPressed: () {
                        _taskProvider.removeDoneTasks();
                      }),
                  Text(
                    'Todo Manager',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '  ${_taskProvider.tasks.length} tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: (Radius.circular(20))),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Task _task = _taskProvider.tasks[index];
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          _taskProvider.removeTask(_task);
                        },
                        child: CheckboxListTile(
                          activeColor: Colors.redAccent,
                          value: _task.isChecked,
                          onChanged: (newValue) {
                            _taskProvider.update(index, newValue);
                          },
                          title: Text(
                            _task.name,
                            style: TextStyle(
                                decoration: _task.isChecked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        ),
                      );
                    },
                    itemCount: _taskProvider.tasks.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
