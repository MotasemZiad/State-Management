import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task_model.dart';
import 'package:state_management/providers/theme_provider.dart';
import 'package:state_management/providers/todo_provider.dart';

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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Container(
        color: themeProvider.themeData == ThemeData.light()
            ? Color(0xFF757575)
            : Colors.black45,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: themeProvider.themeData == ThemeData.light()
                ? Colors.white
                : Color(0xFF151515),
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
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      hintText: 'Task Name',
                      hintStyle: TextStyle(
                        color: themeProvider.themeData == ThemeData.light()
                            ? Colors.black38
                            : Colors.grey,
                      ),
                    ),
                    cursorHeight: 22.0,
                    cursorColor: themeProvider.themeData == ThemeData.light()
                        ? Colors.blue
                        : Colors.greenAccent,
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
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeProvider.themeData == ThemeData.light()
                              ? Colors.blue
                              : Colors.greenAccent,
                        ),
                      ),
                      hintText: 'Task Description',
                      hintStyle: TextStyle(
                        color: themeProvider.themeData == ThemeData.light()
                            ? Colors.black38
                            : Colors.grey,
                      ),
                    ),
                    cursorHeight: 22.0,
                    cursorColor: themeProvider.themeData == ThemeData.light()
                        ? Colors.blue
                        : Colors.greenAccent,
                    onChanged: (value) {
                      taskDescription = value;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    autocorrect: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Completed',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = value;
                          setState(() {});
                        },
                        fillColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 62.0),
                    child: Selector<TodoProvider, TodoProvider>(
                      selector: (_, provider) => provider,
                      builder: (context, watch, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                          ),
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
                              color:
                                  themeProvider.themeData == ThemeData.light()
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
