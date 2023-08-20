import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/model/todo.dart';
import 'package:todo_work/services/todo_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.todoId});

  final String todoId;
  @override
  State<EditPage> createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  final textController = TextEditingController();

  Todo? todo;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var todoService = Provider.of<TodoService>(context, listen: false);
      todo = await todoService.getTodo(widget.todoId);
      if (todo == null) {
        Navigator.pop(context);
      }
      textController.text = todo!.title;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var todoService = context.read<TodoService>();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _save(todoService, context);
                      },
                      child: const Text("Save"),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _remove(todoService, context);
                      },
                      child: const Text("Remove", style: TextStyle()),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save(TodoService todoService, BuildContext context) {
    final text = textController.text;
    todoService.updateTodo(todo!.copyWith(title: text));
    Navigator.pop(context);
  }

  void _remove(TodoService todoService, BuildContext context) {
    todoService.removeTodo(todo!.id);
    Navigator.pop(context);
  }
}
