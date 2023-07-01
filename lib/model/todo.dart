import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String? id;
  final String description;

  Todo({
    String? id,
    required this.description,
  }) : id = id ?? uuid.v1();

  Todo copyWith({
    String? id,
    String? description,
  }) =>
      Todo(
        id: id ?? this.id,
        description: description ?? this.description,
      );
}
