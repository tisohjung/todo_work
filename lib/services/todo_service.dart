import 'package:flutter/material.dart';
import 'package:todo_work/model/todo.dart';

class TodoService with ChangeNotifier {
  final List<Todo> _todos = [Todo(description: "Hello world")];

  List<Todo> get todos {
    return _todos;
  }

  Future<List<Todo>> getTodoList() async {
    return Future.delayed(const Duration(milliseconds: 300), () => _todos);
  }

  addTodo(Todo todo) async {
    Future.delayed(const Duration(milliseconds: 300), () {
      _todos.add(todo);
      notifyListeners();
    });
  }

  removeTodo(String id) async {
    Future.delayed(const Duration(milliseconds: 300), () {
      _todos.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}
