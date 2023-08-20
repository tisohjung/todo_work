import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

const uuid = Uuid();

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
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
