import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_work/model/todo.dart';

class TodoService with ChangeNotifier {
  Box<Todo> todoListBox;
  TodoService({
    required this.todoListBox,
  });

  ValueListenable<Box<Todo>> getTodoList() {
    return todoListBox.listenable();
  }

  Future<Todo> getTodoAt(int index) async {
    return todoListBox.getAt(index)!;
  }

  Future<Todo?> getTodo(String id) async {
    // Hive actually has id of index
    return todoListBox.get(id);
  }

  addTodo(Todo todo) async {
    todoListBox.add(todo);
    notifyListeners();
  }

  updateTodo(Todo todo) async {
    todoListBox.put(todo.id, todo);
    notifyListeners();
  }

  removeTodo(Todo todo) async {
    todo.delete();
    notifyListeners();
  }
}
