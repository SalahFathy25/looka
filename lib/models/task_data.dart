import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  late Box<Task> tasksBox;

  TaskData() {
    tasksBox = Hive.box<Task>('tasks');
    final storedTasks = tasksBox.values.toList();
    tasks = storedTasks;
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    Task newTask = Task(name: newTaskTitle);
    tasks.add(newTask);
    notifyListeners();
    tasksBox.add(newTask);
  }

  void doneTask(Task task) {
    task.doneChange();
    notifyListeners();
    tasksBox.putAt(tasks.indexOf(task), task);
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
    tasksBox.deleteAt(tasks.indexOf(task));
  }

  void updateTask(Task task, String updatedTaskTitle) {
    int index = tasks.indexOf(task);
    if (index != -1) {
      tasks[index].name = updatedTaskTitle;
      notifyListeners();
      tasksBox.putAt(index, tasks[index]);
    }
  }
}
