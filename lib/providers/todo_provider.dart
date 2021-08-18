import 'package:flutter/foundation.dart';
import 'package:state_management/helpers/db_helper.dart';
import 'package:state_management/models/task_model.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    getAllTasks();
  }
  List<TaskModel> allTasks;
  List<TaskModel> completeTasks;
  List<TaskModel> incompleteTasks;

  getAllTasks() async {
    allTasks = await DbHelper.dbHelper.getAllTasks();
    completeTasks = allTasks.where((element) => element.isComplete).toList();
    incompleteTasks = allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertTasks(TaskModel taskModel) async {
    await DbHelper.dbHelper.insertNewTask(taskModel);
    getAllTasks();
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }
}
