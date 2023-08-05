import 'package:flutter/material.dart';
import 'package:todo_work/model/todo.dart';

class CellTodo extends StatelessWidget {
  const CellTodo({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Text(todo.title);
  }
}
