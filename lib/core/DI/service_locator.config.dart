// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_generate/core/DI/register_modules.dart' as _i14;
import 'package:flutter_generate/core/network/network_call.dart' as _i7;
import 'package:flutter_generate/core/network/network_info.dart' as _i6;
import 'package:flutter_generate/features/home/data/datasources/home_remote_datasource.dart'
    as _i9;
import 'package:flutter_generate/features/home/data/repositories/home_repository_impl.dart'
    as _i11;
import 'package:flutter_generate/features/home/domain/repositories/home_repository.dart'
    as _i10;
import 'package:flutter_generate/features/home/domain/usecases/get_todos.dart'
    as _i12;
import 'package:flutter_generate/features/home/presentation/cubit/home/home_cubit.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.Dio>(() => injectionModule.dio);
    gh.factory<_i4.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i5.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i6.NetworkInfo>(
        () => _i6.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
    gh.singleton<_i7.RestClient>(_i7.RestClient(gh<_i3.Dio>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i9.HomeRemoteDatasource>(
        () => _i9.HomeRemoteDatasourceImpl(
              logger: gh<_i5.Logger>(),
              restClient: gh<_i7.RestClient>(),
            ));
    gh.lazySingleton<_i10.HomeRepository>(() => _i11.HomeRepositoryImpl(
          networkInfo: gh<_i6.NetworkInfo>(),
          homeRemoteDatasource: gh<_i9.HomeRemoteDatasource>(),
        ));
    gh.lazySingleton<_i12.GetTodo>(
        () => _i12.GetTodo(gh<_i10.HomeRepository>()));
    gh.factory<_i13.HomeCubit>(
        () => _i13.HomeCubit(getTodo: gh<_i12.GetTodo>()));
    return this;
  }
}

class _$InjectionModule extends _i14.InjectionModule {}
