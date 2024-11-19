// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/contracts/auth_offline_datasource.dart' as _i7;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i19;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i8;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i20;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i27;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i26;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i15;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i16;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i18;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i17;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i25;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i28;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i3;
import '../../features/auth/Register/data/register_onlineDataSource.dart'
    as _i9;
import '../../features/auth/Register/data/register_onlineDataSource_impl.dart'
    as _i10;
import '../../features/auth/Register/data/register_repository_impl.dart'
    as _i12;
import '../../features/auth/Register/domain/register_repository.dart' as _i11;
import '../../features/auth/Register/domain/register_useCase.dart' as _i23;
import '../../features/auth/Register/presentation/register_validator/register_validator.dart'
    as _i4;
import '../../features/auth/Register/presentation/register_viewModel.dart'
    as _i24;
import '../../features/home/data/contracts/remote_datasource.dart' as _i13;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i14;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i22;
import '../../features/home/domain/repositories/home_repository.dart' as _i21;
import '../network/api/api_manager.dart' as _i6;
import '../network/api/network_module.dart' as _i29;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i3.ForgetPasswordValidator>(
        () => _i3.ForgetPasswordValidator());
    gh.factory<_i4.RegisterValidator>(() => _i4.RegisterValidator());
    gh.lazySingleton<_i5.Dio>(() => dioModule.provideDio());
    gh.singleton<_i6.ApiManager>(() => _i6.ApiManager(gh<_i5.Dio>()));
    gh.factory<_i7.AuthOfflineDatasource>(
        () => _i8.AuthOfflineDatasourceImpl());
    gh.factory<_i9.RegisterOnlineDatasource>(
        () => _i10.RegisterOnlineDatasourceImpl(gh<_i6.ApiManager>()));
    gh.factory<_i11.RegisterRepository>(
        () => _i12.RegisterRepositoryImpl(gh<_i9.RegisterOnlineDatasource>()));
    gh.factory<_i13.RemoteDatasource>(
        () => _i14.RemoteDatasourceImpl(gh<_i6.ApiManager>()));
    gh.factory<_i15.ForgetPasswordOnlineDatasource>(
        () => _i16.ForgetPasswordOnlineDatasourceImpl(gh<_i6.ApiManager>()));
    gh.factory<_i17.ForgetPasswordRepository>(() =>
        _i18.ForgetPasswordRepositoryImpl(
            gh<_i15.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i19.AuthOnlineDatasource>(
        () => _i20.AuthOnlineDatasourceImpl(gh<_i6.ApiManager>()));
    gh.factory<_i21.HomeRepository>(
        () => _i22.HomeRepositoryImpl(gh<_i13.RemoteDatasource>()));
    gh.factory<_i23.RegisterUseCase>(
        () => _i23.RegisterUseCase(gh<_i11.RegisterRepository>()));
    gh.factory<_i24.RegisterViewModel>(() => _i24.RegisterViewModel(
          gh<_i23.RegisterUseCase>(),
          gh<_i4.RegisterValidator>(),
        ));
    gh.factory<_i25.ForgetPasswordUsecase>(
        () => _i25.ForgetPasswordUsecase(gh<_i17.ForgetPasswordRepository>()));
    gh.factory<_i26.AuthRepository>(() => _i27.AuthRepositoryImpl(
          gh<_i19.AuthOnlineDatasource>(),
          gh<_i7.AuthOfflineDatasource>(),
        ));
    gh.factory<_i28.ForegetPasswordViewmodel>(
        () => _i28.ForegetPasswordViewmodel(
              gh<_i25.ForgetPasswordUsecase>(),
              gh<_i3.ForgetPasswordValidator>(),
            ));
    return this;
  }
}

class _$DioModule extends _i29.DioModule {}
