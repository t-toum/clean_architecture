import 'package:flutter_generate/core/error/exceptions.dart';
import 'package:flutter_generate/core/models/todo.dart';
import 'package:flutter_generate/core/network/network_call.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class HomeRemoteDatasource {
  Future<List<Todo>> getTodos();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final RestClient restClient;
  final Logger logger;
  HomeRemoteDatasourceImpl({
    required this.logger,
    required this.restClient,
  });

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final response = await restClient.getTodos();
      logger.i(response);
      return response;
    } catch (e) {
      logger.d(e);
      throw ServerException(e.toString());
    }
  }
}
