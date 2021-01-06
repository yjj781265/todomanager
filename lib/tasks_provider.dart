import 'package:flutter/cupertino.dart';
import 'package:todo_mgr/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = List();

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
}
