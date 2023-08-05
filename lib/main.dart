import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/features/list/list_page.dart';
import 'package:todo_work/services/todo_service.dart';

void main() {
  final todoService = TodoService();

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
