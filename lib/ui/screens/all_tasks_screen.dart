import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: provider.allTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskWidget(
          taskModel: provider.allTasks[index],
        );
      },
    );
  }
}
