import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/helpers/db_helper.dart';
import 'package:state_management/providers/theme_provider.dart';
import 'package:state_management/providers/todo_provider.dart';
import 'package:state_management/ui/main_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todoey',
          theme: value.themeData,
          home: MainScreen(),
        ),
      ),
    );
  }
}
