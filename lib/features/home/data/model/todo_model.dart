import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Todo {
  const TodoModel({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) : super(
          completed: completed,
          id: id,
          title: title,
          userId: userId,
        );
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
