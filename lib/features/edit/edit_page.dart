import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/model/todo.dart';
import 'package:todo_work/services/todo_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  final textController = TextEditingController();

  void _save(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var todoState = context.read<TodoService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('EditScreen'),
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
                    final text = textController.text;
                    todoState.addTodo(Todo(title: text));
                    Navigator.pop(context);
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
