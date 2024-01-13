import 'package:dio/dio.dart';
import 'package:flutter_generate/core/routers/app_router.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
//injecting third party libraries
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Dio get dio => Dio();
  InternetConnectionChecker get internetConnectionChecker => InternetConnectionChecker();
  AppRouter get appRouter => AppRouter();
  Logger get logger => Logger();
}
