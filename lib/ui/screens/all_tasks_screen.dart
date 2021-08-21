import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<TaskModel>>(
      builder: (context, value, child) {
        return value.length == 0
            ? Center(
                child: Text(
                  'No tasks have been added yet',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: value.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskWidget(
                    taskModel: value[index],
                  );
                },
              );
      },
      selector: (_, provider) => provider.allTasks,
    );
    // return Consumer<TodoProvider>(
    //   builder: (context, value, child) => ListView.builder(
    //     itemCount: value.allTasks.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return TaskWidget(
    //         taskModel: value.allTasks[index],
    //       );
    //     },
    //   ),
    // );
  }
}
