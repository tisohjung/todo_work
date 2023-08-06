import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String id;
  final String title;

  Todo({
    String? id,
    required this.title,
  }) : id = id ?? uuid.v1();

  Todo copyWith({
    String? id,
    String? title,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
