import 'package:flutter_generate/core/util/constant.dart';
import 'package:flutter_generate/features/home/data/model/todo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_call.g.dart';

@RestApi(baseUrl: baseUrl)
@singleton
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  @GET("/todos")
  Future<List<TodoModel>> getTodos();
}
