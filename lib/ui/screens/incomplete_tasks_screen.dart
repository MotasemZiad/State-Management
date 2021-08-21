import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<TaskModel>>(
      builder: (context, value, child) {
        return value.where((element) => !element.isComplete).toList().length ==
                0
            ? Center(
                child: Text(
                  'Congratulation\nYou don\'t have any incomplete task',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) =>
                    TaskWidget(taskModel: value[index]),
                itemCount: value.length,
              );
      },
      selector: (_, provider) => provider.incompleteTasks,
    );
    // return Consumer<TodoProvider>(
    //   builder: (context, value, child) => ListView.builder(
    //     itemCount: value.incompleteTasks.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return TaskWidget(
    //         taskModel: value.incompleteTasks[index],
    //       );
    //     },
    //   ),
    // );
  }
}
