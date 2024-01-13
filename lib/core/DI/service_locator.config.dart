// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_generate/core/DI/register_modules.dart' as _i15;
import 'package:flutter_generate/core/network/network_call.dart' as _i8;
import 'package:flutter_generate/core/network/network_info.dart' as _i7;
import 'package:flutter_generate/core/routers/app_router.dart' as _i3;
import 'package:flutter_generate/features/home/data/datasources/home_remote_datasource.dart'
    as _i10;
import 'package:flutter_generate/features/home/data/repositories/home_repository_impl.dart'
    as _i12;
import 'package:flutter_generate/features/home/domain/repositories/home_repository.dart'
    as _i11;
import 'package:flutter_generate/features/home/domain/usecases/get_todos_usecase.dart'
    as _i13;
import 'package:flutter_generate/features/home/presentation/cubit/home/home_cubit.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

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
    gh.factory<_i3.AppRouter>(() => injectionModule.appRouter);
    gh.factory<_i4.Dio>(() => injectionModule.dio);
    gh.factory<_i5.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i6.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i7.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.singleton<_i8.RestClient>(_i8.RestClient(gh<_i4.Dio>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.HomeRemoteDatasource>(
        () => _i10.HomeRemoteDatasourceImpl(
              logger: gh<_i6.Logger>(),
              restClient: gh<_i8.RestClient>(),
            ));
    gh.lazySingleton<_i11.HomeRepository>(() => _i12.HomeRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          homeRemoteDatasource: gh<_i10.HomeRemoteDatasource>(),
        ));
    gh.lazySingleton<_i13.GetTodoUsecase>(
        () => _i13.GetTodoUsecase(gh<_i11.HomeRepository>()));
    gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(gh<_i13.GetTodoUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i15.InjectionModule {}
