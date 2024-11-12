// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/contracts/auth_offline_datasource.dart'
    as _i871;
import '../../features/auth/data/contracts/auth_online_datasource.dart'
    as _i981;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i601;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i849;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../network/api/api_manager.dart' as _i561;
import '../network/api/network_module.dart' as _i138;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i561.ApiManager>(() => _i561.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i871.AuthOfflineDatasource>(
        () => _i601.AuthOfflineDatasourceImpl());
    gh.factory<_i981.AuthOnlineDatasource>(
        () => _i849.AuthOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i981.AuthOnlineDatasource>(),
          gh<_i871.AuthOfflineDatasource>(),
        ));
    return this;
  }
}

class _$DioModule extends _i138.DioModule {}
