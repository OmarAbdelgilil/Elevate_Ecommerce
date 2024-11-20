// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/contracts/auth_offline_datasource.dart' as _i8;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i22;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i9;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i23;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i34;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i33;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i18;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i19;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i21;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i20;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i32;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i36;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i3;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i16;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i17;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i25;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i24;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i26;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i31;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i4;
import '../../features/auth/Register/data/register_onlineDataSource.dart'
    as _i10;
import '../../features/auth/Register/data/register_onlineDataSource_impl.dart'
    as _i11;
import '../../features/auth/Register/data/register_repository_impl.dart'
    as _i13;
import '../../features/auth/Register/domain/register_repository.dart' as _i12;
import '../../features/auth/Register/domain/register_useCase.dart' as _i29;
import '../../features/auth/Register/presentation/register_validator/register_validator.dart'
    as _i5;
import '../../features/auth/Register/presentation/register_viewModel.dart'
    as _i30;
import '../../features/home/data/contracts/remote_datasource.dart' as _i14;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i15;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i28;
import '../../features/home/domain/repositories/home_repository.dart' as _i27;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i35;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i37;
import '../network/api/api_manager.dart' as _i7;
import '../network/api/network_module.dart' as _i38;

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
    gh.factory<_i4.LoginValidator>(() => _i4.LoginValidator());
    gh.factory<_i5.RegisterValidator>(() => _i5.RegisterValidator());
    gh.lazySingleton<_i6.Dio>(() => dioModule.provideDio());
    gh.singleton<_i7.ApiManager>(() => _i7.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i8.AuthOfflineDatasource>(
        () => _i9.AuthOfflineDatasourceImpl());
    gh.factory<_i10.RegisterOnlineDatasource>(
        () => _i11.RegisterOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i12.RegisterRepository>(
        () => _i13.RegisterRepositoryImpl(gh<_i10.RegisterOnlineDatasource>()));
    gh.factory<_i14.RemoteDatasource>(
        () => _i15.RemoteDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i16.LoginOnlineDatasource>(
        () => _i17.LoginOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i18.ForgetPasswordOnlineDatasource>(
        () => _i19.ForgetPasswordOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i20.ForgetPasswordRepository>(() =>
        _i21.ForgetPasswordRepositoryImpl(
            gh<_i18.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i22.AuthOnlineDatasource>(
        () => _i23.AuthOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i24.LoginRepo>(
        () => _i25.LoginRepoImpl(gh<_i16.LoginOnlineDatasource>()));
    gh.factory<_i26.LoginUsecase>(
        () => _i26.LoginUsecase(gh<_i24.LoginRepo>()));
    gh.factory<_i27.HomeRepository>(
        () => _i28.HomeRepositoryImpl(gh<_i14.RemoteDatasource>()));
    gh.factory<_i29.RegisterUseCase>(
        () => _i29.RegisterUseCase(gh<_i12.RegisterRepository>()));
    gh.factory<_i30.RegisterViewModel>(() => _i30.RegisterViewModel(
          gh<_i29.RegisterUseCase>(),
          gh<_i5.RegisterValidator>(),
        ));
    gh.factory<_i31.LoginViewModel>(
        () => _i31.LoginViewModel(gh<_i26.LoginUsecase>()));
    gh.factory<_i32.ForgetPasswordUsecase>(
        () => _i32.ForgetPasswordUsecase(gh<_i20.ForgetPasswordRepository>()));
    gh.factory<_i33.AuthRepository>(() => _i34.AuthRepositoryImpl(
          gh<_i22.AuthOnlineDatasource>(),
          gh<_i8.AuthOfflineDatasource>(),
        ));
    gh.factory<_i35.GetCategoriesUsecase>(
        () => _i35.GetCategoriesUsecase(gh<_i27.HomeRepository>()));
    gh.factory<_i36.ForegetPasswordViewmodel>(
        () => _i36.ForegetPasswordViewmodel(
              gh<_i32.ForgetPasswordUsecase>(),
              gh<_i3.ForgetPasswordValidator>(),
            ));
    gh.factory<_i37.CategoriesViewmodel>(
        () => _i37.CategoriesViewmodel(gh<_i35.GetCategoriesUsecase>()));
    return this;
  }
}

class _$DioModule extends _i38.DioModule {}
