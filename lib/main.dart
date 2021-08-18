import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/helpers/db_helper.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/main_screen.dart';
import 'package:state_management/utils/constants.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: colorPrimary,
        ),
        // darkTheme: ThemeData.dark(),
        home: MainScreen(),
      ),
    );
  }
}
