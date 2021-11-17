import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<TodoProvider, List<TaskModel>>(
      builder: (context, value, child) {
        return value.where((element) => element.isComplete).toList().length == 0
            ? Center(
                child: Text(
                  'You don\'t complete any task.',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
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
      selector: (_, provider) => provider.completeTasks,
    );

    // return Consumer<TodoProvider>(
    //   builder: (context, value, child) {
    //     return ListView.builder(
    //       itemCount: value.completeTasks.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return TaskWidget(
    //           taskModel: value.completeTasks[index],
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
