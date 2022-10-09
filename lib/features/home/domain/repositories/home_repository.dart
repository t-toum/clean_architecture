import 'package:dartz/dartz.dart';
import 'package:flutter_generate/core/error/failures.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}
