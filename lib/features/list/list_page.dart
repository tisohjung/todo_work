import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/services/todo_service.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var todoService = context.watch<TodoService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoService.todos.length,
          itemBuilder: (context, index) {
            var todo = todoService.todos[index];
            return Text(todo.description);
          },
        ),
      ),
    );
  }
}
