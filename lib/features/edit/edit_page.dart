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

  void _save(TodoService todoService, BuildContext context) {
  }
}
