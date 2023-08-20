import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/features/list/list_page.dart';
import 'package:todo_work/model/constants.dart';
import 'package:todo_work/model/todo.dart';
import 'package:todo_work/services/todo_service.dart';

void main() async {
  Hive.init('./');
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(Boxes.todoList);
  final todoService = TodoService(todoListBox: Hive.box<Todo>(Boxes.todoList));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => todoService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListPage(),
    );
  }
}
