import 'dart:io';

import 'package:state_management/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();

  static final String dbName = 'tasks.db';

  static final String tasksTableName = 'tasks';
  static final String idColumn = 'id';
  static final String taskNameColumn = 'taskName';
  static final String taskDescriptionColumn = 'taskDescription';
  static final String isCompleteColumn = 'isComplete';
  static final int databaseVersion = 1;

  Database database;
  Future<Database> initDatabase() async {
    if (database == null) {
      return await createConnection();
    } else {
      return database;
    }
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);

    Database database = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tasksTableName(
          $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $taskNameColumn TEXT NOT NULL,
          $taskDescriptionColumn TEXT,
          $isCompleteColumn INTEGER
          );
        ''');
      },
    );
    print('database has been opened');
    return database;
  }

  Future<List<TaskModel>> getAllTasks() async {
    database = await initDatabase();
    try {
      List<Map<String, dynamic>> result = await database.query(tasksTableName);
      List<TaskModel> tasks = result.map((e) => TaskModel.fromMap(e)).toList();
      return tasks;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<int> insertNewTask(TaskModel taskModel) async {
    database = await initDatabase();
    try {
      int rowColumn = await database.insert(tasksTableName, taskModel.toMap());
      return rowColumn;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> updateTask(TaskModel taskModel) async {
    database = await initDatabase();
    try {
      await database.update(tasksTableName, taskModel.toMap(),
          where: '$idColumn = ?', whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> deleteTask(TaskModel taskModel) async {
    database = await initDatabase();
    try {
      await database.delete(tasksTableName,
          where: '$idColumn = ?', whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      print(e.toString);
      return null;
    }
  }
}
