import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const Todo({this.id, this.userId, this.title, this.completed});

  @override
  List<Object?> get props => [userId, id, title, completed];
}
