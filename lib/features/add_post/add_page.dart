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
  void _save(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var todoState = context.read<TodoService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('AddScreen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'add page',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _save(context),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
