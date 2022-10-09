import 'package:equatable/equatable.dart';

abstract class CustomeException extends Equatable {
  final String msg;
  const CustomeException(this.msg);
  @override
  List<Object> get props => [msg];
}

class ServerException extends CustomeException implements Exception {
  const ServerException(String msg) : super(msg);
}

class CacheException implements Exception {
  final String msg;
  CacheException(this.msg);
}
