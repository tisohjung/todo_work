import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_work/features/add/add_page.dart';
import 'package:todo_work/features/edit/edit_page.dart';
import 'package:todo_work/features/list/views/cell_todo.dart';
import 'package:todo_work/model/todo.dart';
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

  void _moveToEditPost(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPage(todoIndex: id),
      ),
    );
  }

  void _removeTodo(Todo todo) {
    var todoService = context.read<TodoService>();
    todoService.removeTodo(todo);
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
        child: ValueListenableBuilder(
          valueListenable: todoService.getTodoList(),
          builder: (BuildContext context, Box<Todo> box, _) {
            var todos = box.values.toList().cast<Todo>();
            return _todoList(todos);
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

  ListView _todoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        var todo = todos[index];
        return Dismissible(
          key: Key(todo.id),
          onDismissed: (direction) {
            _removeTodo(todo);
          },
          child: InkWell(
              onTap: () {
                _moveToEditPost(context, index);
              },
              child: CellTodo(todo: todo)),
        );
      },
    );
  }
}
