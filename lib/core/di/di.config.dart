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
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/contracts/auth_offline_datasource.dart' as _i8;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i18;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i9;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i19;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i29;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i28;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i14;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i15;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i17;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i16;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i27;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i33;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i4;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i12;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i13;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i22;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i21;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i23;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i26;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i5;
import '../../features/home/data/contracts/remote_datasource.dart' as _i10;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i11;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i25;
import '../../features/home/domain/repositories/home_repository.dart' as _i24;
import '../../features/home/domain/usecase/get_all_best_seller_products_usecase.dart'
    as _i31;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i30;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i32;
import '../network/api/api_manager.dart' as _i7;
import '../network/api/network_module.dart' as _i34;
import '../network/services/shared_preferences_service.dart' as _i20;

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
    final registerModule = _$RegisterModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i4.ForgetPasswordValidator>(
        () => _i4.ForgetPasswordValidator());
    gh.factory<_i5.LoginValidator>(() => _i5.LoginValidator());
    gh.lazySingleton<_i6.Dio>(() => dioModule.provideDio());
    gh.singleton<_i7.ApiManager>(() => _i7.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i8.AuthOfflineDatasource>(
        () => _i9.AuthOfflineDatasourceImpl());
    gh.factory<_i10.RemoteDatasource>(
        () => _i11.RemoteDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i12.LoginOnlineDatasource>(
        () => _i13.LoginOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i14.ForgetPasswordOnlineDatasource>(
        () => _i15.ForgetPasswordOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i16.ForgetPasswordRepository>(() =>
        _i17.ForgetPasswordRepositoryImpl(
            gh<_i14.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i18.AuthOnlineDatasource>(
        () => _i19.AuthOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.singleton<_i20.SharedPreferencesService>(
        () => _i20.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i21.LoginRepo>(
        () => _i22.LoginRepoImpl(gh<_i12.LoginOnlineDatasource>()));
    gh.factory<_i23.LoginUsecase>(
        () => _i23.LoginUsecase(gh<_i21.LoginRepo>()));
    gh.factory<_i24.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i10.RemoteDatasource>()));
    gh.factory<_i26.LoginViewModel>(
        () => _i26.LoginViewModel(gh<_i23.LoginUsecase>()));
    gh.factory<_i27.ForgetPasswordUsecase>(
        () => _i27.ForgetPasswordUsecase(gh<_i16.ForgetPasswordRepository>()));
    gh.factory<_i28.AuthRepository>(() => _i29.AuthRepositoryImpl(
          gh<_i18.AuthOnlineDatasource>(),
          gh<_i8.AuthOfflineDatasource>(),
        ));
    gh.factory<_i30.GetAllProductsUseCase>(
        () => _i30.GetAllProductsUseCase(gh<_i24.HomeRepository>()));
    gh.factory<_i31.GetAllBestSellerProductsUseCase>(
        () => _i31.GetAllBestSellerProductsUseCase(gh<_i24.HomeRepository>()));
    gh.factory<_i32.ProductViewModel>(() => _i32.ProductViewModel(
          gh<_i30.GetAllProductsUseCase>(),
          gh<_i20.SharedPreferencesService>(),
          gh<_i31.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i33.ForegetPasswordViewmodel>(
        () => _i33.ForegetPasswordViewmodel(
              gh<_i27.ForgetPasswordUsecase>(),
              gh<_i4.ForgetPasswordValidator>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}

class _$DioModule extends _i34.DioModule {}
