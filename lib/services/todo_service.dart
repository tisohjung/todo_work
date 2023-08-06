import 'package:flutter/material.dart';
import 'package:todo_work/model/todo.dart';

class TodoService with ChangeNotifier {
  final List<Todo> _todos = [Todo(title: "Hello world")];

  List<Todo> get todos {
    return _todos;
  }

  Future<List<Todo>> getTodoList() async {
    return Future.delayed(const Duration(milliseconds: 300), () => _todos);
  }

  Future<Todo> getTodo(String id) async {
    return Future.delayed(const Duration(milliseconds: 300),
        () => _todos.firstWhere((element) => element.id == id));
  }

  addTodo(Todo todo) async {
    Future.delayed(const Duration(milliseconds: 300), () {
      _todos.add(todo);
      notifyListeners();
    });
  }

  updateTodo(Todo todo) async {
    Future.delayed(const Duration(milliseconds: 300), () {
      var index = _todos.indexWhere((element) => element.id == todo.id);
      _todos[index] = todo;
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
