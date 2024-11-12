import 'package:flutter/material.dart';
import 'package:todo_code/firebase_function.dart';
import 'package:todo_code/models/task_modle.dart';

class TasksProvidar with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  Future<void> getTask() async {
    List<TaskModel> allTask =
        await FirebaseFunctions.getAllTasksFromFirestore();

    tasks = allTask
        .where((task) =>
            task.date.year == selectedDate.year &&
            task.date.month == selectedDate.month &&
            task.date.day == selectedDate.day)
        .toList();
    notifyListeners();
  }

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    getTask();
  }
}
