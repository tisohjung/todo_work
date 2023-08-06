import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/model/todo.dart';
import 'package:todo_work/services/todo_service.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  final textController = TextEditingController();

  void _save(TodoService todoService, BuildContext context) {
    final text = textController.text;
    todoService.addTodo(Todo(title: text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var todoService = context.read<TodoService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('AddScreen'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _save(todoService, context);
                  },
                  child: const Text("Save"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
