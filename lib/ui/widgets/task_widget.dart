import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/todo_provider.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel taskModel;
  TaskWidget({
    @required this.taskModel,
  });
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Card(
      elevation: 3.0,
      color: taskModel.isComplete ? Colors.green : Colors.red,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        leading: Checkbox(
          value: taskModel.isComplete,
          onChanged: (value) {
            taskModel.isComplete = value;
            todoProvider.updateTask(taskModel);
          },
        ),
        title: Text(
          taskModel.taskName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          taskModel.taskDescription ?? 'No description',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () => todoProvider.deleteTask(taskModel),
        ),
      ),
    );
  }
}
