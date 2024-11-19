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
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i710;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i988;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i568;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i983;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i334;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i126;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i267;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i460;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i584;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i974;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i995;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i455;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i375;
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
    gh.factory<_i375.ForgetPasswordValidator>(
        () => _i375.ForgetPasswordValidator());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i561.ApiManager>(() => _i561.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i871.AuthOfflineDatasource>(
        () => _i601.AuthOfflineDatasourceImpl());
    gh.factory<_i710.LoginOnlineDatasource>(
        () => _i988.LoginOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i267.ForgetPasswordOnlineDatasource>(
        () => _i460.ForgetPasswordOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i974.ForgetPasswordRepository>(() =>
        _i584.ForgetPasswordRepositoryImpl(
            gh<_i267.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i981.AuthOnlineDatasource>(
        () => _i849.AuthOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i983.LoginRepo>(
        () => _i568.LoginRepoImpl(gh<_i710.LoginOnlineDatasource>()));
    gh.factory<_i334.LoginUsecase>(
        () => _i334.LoginUsecase(gh<_i983.LoginRepo>()));
    gh.factory<_i126.LoginViewModel>(
        () => _i126.LoginViewModel(gh<_i334.LoginUsecase>()));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i974.ForgetPasswordRepository>()));
    gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i981.AuthOnlineDatasource>(),
          gh<_i871.AuthOfflineDatasource>(),
        ));
    gh.factory<_i455.ForegetPasswordViewmodel>(
        () => _i455.ForegetPasswordViewmodel(
              gh<_i995.ForgetPasswordUsecase>(),
              gh<_i375.ForgetPasswordValidator>(),
            ));
    return this;
  }
}

class _$DioModule extends _i138.DioModule {}
