import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/model/todo.dart';
import 'package:todo_work/services/todo_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.todoIndex});

  final int todoIndex;
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
      todo = await todoService.getTodoAt(widget.todoIndex);
      if (todo == null) {
        Navigator.pop(context);
      }
      textController.text = todo!.title;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        _save(context);
                      },
                      child: const Text("Save"),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (todo != null) {
                          _remove(context, todo!);
                        }
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

  void _save(BuildContext context) {
    var todoService = context.read<TodoService>();
    final text = textController.text;
    todoService.updateTodo(todo!.copyWith(title: text));
    Navigator.pop(context);
  }

  void _remove(BuildContext context, Todo todo) {
    var todoService = context.read<TodoService>();
    todoService.removeTodo(todo);
    Navigator.pop(context);
  }
}
