import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/features/add/add_page.dart';
import 'package:todo_work/features/edit/edit_page.dart';
import 'package:todo_work/features/list/views/cell_todo.dart';
import 'package:todo_work/services/todo_service.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  void _moveToAddPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPage()),
    );
  }

  void _moveToEditPost(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPage(todoId: id),
      ),
    );
  }

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
            return Dismissible(
              key: Key(todo.id),
              onDismissed: (direction) {
                todoService.removeTodo(todo.id);
              },
              child: InkWell(
                  onTap: () {
                    _moveToEditPost(context, todo.id);
                  },
                  child: CellTodo(todo: todo)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _moveToAddPost(context),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
