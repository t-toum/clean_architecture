import 'package:dartz/dartz.dart';
import 'package:flutter_generate/core/error/failures.dart';
import 'package:flutter_generate/core/usecases/no_params.dart';
import 'package:flutter_generate/core/usecases/usecase.dart';
import 'package:flutter_generate/features/home/domain/entity/todo.dart';
import 'package:flutter_generate/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTodoUsecase implements UseCase<List<Todo>, NoParams> {
  final HomeRepository homeRepository;

  GetTodoUsecase(this.homeRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async {
    return await homeRepository.getTodos();
  }
}
