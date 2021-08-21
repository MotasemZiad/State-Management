import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/utils/constants.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String taskName;
  String taskDescription;
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task Name',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  cursorHeight: 22.0,
                  onChanged: (value) {
                    taskName = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autocorrect: true,
                  autofocus: true,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task Description',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  cursorHeight: 22.0,
                  onChanged: (value) {
                    taskDescription = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  autocorrect: true,
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = value;
                    setState(() {});
                  },
                  activeColor: Colors.blue,
                  fillColor: MaterialStateProperty.all(Colors.blue),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 62.0),
                    child: Selector<TodoProvider, TodoProvider>(
                      selector: (_, provider) => provider,
                      builder: (context, watch, child) {
                        return ElevatedButton(
                          onPressed: () {
                            watch.insertTasks(TaskModel(
                              taskName: taskName,
                              taskDescription: taskDescription,
                              isComplete: isChecked,
                            ));
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    )
                    // child: Consumer<TodoProvider>(
                    //   builder: (context, watch, child) {
                    //     return ElevatedButton(
                    //       onPressed: () {
                    //         watch.insertTasks(TaskModel(
                    //           taskName: taskName,
                    //           taskDescription: taskDescription,
                    //           isComplete: isChecked,
                    //         ));
                    //         Navigator.of(context).pop();
                    //       },
                    //       child: Text(
                    //         'Add',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 20.0,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
