import 'package:dartz/dartz.dart';
import 'package:flutter_generate/core/error/exceptions.dart';
import 'package:flutter_generate/core/error/failures.dart';
import 'package:flutter_generate/core/models/todo.dart';
import 'package:flutter_generate/core/network/network_info.dart';
import 'package:flutter_generate/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_generate/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepositoryImpl(
      {required this.networkInfo, required this.homeRemoteDatasource});

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      if (await networkInfo.isConnected) {
        final listTodos = await homeRemoteDatasource.getTodos();
        return Right(listTodos);
      } else {
        return const Left(ServerFailure("No Internet connection"));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
