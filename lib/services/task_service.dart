import 'package:todo/models/task.dart';

class TaskService {
  static final List<Task> _tasks = List.empty(growable: true);
  static List<Task> get tasks => _tasks;
  void addTask({required String title, String? subtitle}) {
    _tasks.add(Task(title: title, subtitle: subtitle ?? ""));
  }

  void removeTask({required Task task}) {
    _tasks.remove(task);
  }
}
