import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todo_mgr/task.dart';

class TaskProvider extends ChangeNotifier {
  static const String _kListKey = "tasks";
  List tasks = List();
  var box = Hive.box('taskBox');

  TaskProvider() {
    tasks = box.get(_kListKey);
    tasks = tasks == null ? List<Task>() : tasks.cast<Task>();
  }

  add(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  update(int index, bool isChecked) {
    tasks[index].isChecked = isChecked;
    notifyListeners();
  }

  removeDoneTasks() {
    tasks.removeWhere((task) => task.isChecked);
    notifyListeners();
  }

  removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    box.put(_kListKey, tasks);
    super.notifyListeners();
  }
}
