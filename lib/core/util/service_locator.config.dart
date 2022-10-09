// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../features/home/data/datasources/home_remote_datasource.dart'
    as _i9;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i11;
import '../../features/home/domain/repositories/home_repository.dart' as _i10;
import '../../features/home/domain/usecases/get_todos.dart' as _i12;
import '../../features/home/presentation/cubit/home/home_cubit.dart' as _i13;
import '../network/network_call.dart' as _i7;
import '../network/network_info.dart' as _i6;
import 'register_modules.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.Dio>(() => injectionModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => injectionModule.internetConnectionChecker);
  gh.factory<_i5.Logger>(() => injectionModule.logger);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.singleton<_i7.RestClient>(_i7.RestClient(get<_i3.Dio>()));
  await gh.factoryAsync<_i8.SharedPreferences>(() => injectionModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i9.HomeRemoteDatasource>(() => _i9.HomeRemoteDatasourceImpl(
      logger: get<_i5.Logger>(), restClient: get<_i7.RestClient>()));
  gh.lazySingleton<_i10.HomeRepository>(() => _i11.HomeRepositoryImpl(
      networkInfo: get<_i6.NetworkInfo>(),
      homeRemoteDatasource: get<_i9.HomeRemoteDatasource>()));
  gh.lazySingleton<_i12.GetTodo>(
      () => _i12.GetTodo(get<_i10.HomeRepository>()));
  gh.factory<_i13.HomeCubit>(
      () => _i13.HomeCubit(getTodo: get<_i12.GetTodo>()));
  return get;
}

class _$InjectionModule extends _i14.InjectionModule {}
