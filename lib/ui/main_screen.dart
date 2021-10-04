import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/theme_provider.dart';
import 'package:state_management/ui/screens/all_tasks_screen.dart';
import 'package:state_management/ui/screens/complete_tasks_screen.dart';
import 'package:state_management/ui/screens/incomplete_tasks_screen.dart';
import 'package:state_management/ui/screens/new_task_screen.dart';

class MainScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo-List'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'All Tasks',
              ),
              Tab(
                text: 'Complete Tasks',
              ),
              Tab(
                text: 'Incomplete Tasks',
              ),
            ],
            isScrollable: true,
          ),
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Switch(
                value: themeProvider.themeData == ThemeData.light(),
                onChanged: (value) {
                  if (value) {
                    themeProvider.setThemeData(AppThemeMode.light);
                  } else {
                    themeProvider.setThemeData(AppThemeMode.dark);
                  }
                },
                activeThumbImage: AssetImage('assets/images/sun.png'),
                inactiveThumbImage: AssetImage('assets/images/moon.png'),
              ),
            ),
          ],
        ),
        body: TabBarView(children: [
          AllTasksScreen(),
          CompleteTasksScreen(),
          InCompleteTasksScreen(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => NewTaskScreen(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
