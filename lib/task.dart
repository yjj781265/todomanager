import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType()
class Task {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isChecked;
  @HiveField(2)
  DateTime dateTime;

  Task(this.name, this.isChecked, this.dateTime);
}
