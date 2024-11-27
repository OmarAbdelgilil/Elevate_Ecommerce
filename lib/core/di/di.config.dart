// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/contracts/auth_offline_datasource.dart' as _i9;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i23;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i10;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i24;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i38;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i37;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i19;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i20;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i22;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i21;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i36;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i48;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i4;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i17;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i18;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i29;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i28;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i32;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i35;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i5;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i13;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i14;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i31;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i30;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i45;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i6;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i46;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i11;
import '../../features/home/data/contracts/remote_datasource.dart' as _i15;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i12;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i16;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i34;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i27;
import '../../features/home/domain/repositories/home_repository.dart' as _i33;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i26;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i40;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i41;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i39;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i42;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i43;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i50;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i49;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i44;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i47;
import '../network/api/api_manager.dart' as _i8;
import '../network/api/network_module.dart' as _i51;
import '../network/services/shared_preferences_service.dart' as _i25;

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
    gh.factory<_i6.RegisterValidator>(() => _i6.RegisterValidator());
    gh.lazySingleton<_i7.Dio>(() => dioModule.provideDio());
    gh.singleton<_i8.ApiManager>(() => _i8.ApiManager(gh<_i7.Dio>()));
    gh.factory<_i9.AuthOfflineDatasource>(
        () => _i10.AuthOfflineDatasourceImpl());
    gh.factory<_i11.ProductDetails_Onlinedatasource>(
        () => _i12.ProductDetails_Onlinedatasource_Impl(gh<_i8.ApiManager>()));
    gh.factory<_i13.RegisterOnlineDatasource>(
        () => _i14.RegisterOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i15.RemoteDatasource>(
        () => _i16.RemoteDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i17.LoginOnlineDatasource>(
        () => _i18.LoginOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i19.ForgetPasswordOnlineDatasource>(
        () => _i20.ForgetPasswordOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.factory<_i21.ForgetPasswordRepository>(() =>
        _i22.ForgetPasswordRepositoryImpl(
            gh<_i19.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i23.AuthOnlineDatasource>(
        () => _i24.AuthOnlineDatasourceImpl(gh<_i8.ApiManager>()));
    gh.singleton<_i25.SharedPreferencesService>(
        () => _i25.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i26.ProductDetailsRepository>(() => _i27.ProductDetailsRepoImpl(
        gh<_i11.ProductDetails_Onlinedatasource>()));
    gh.factory<_i28.LoginRepo>(
        () => _i29.LoginRepoImpl(gh<_i17.LoginOnlineDatasource>()));
    gh.factory<_i30.RegisterRepository>(
        () => _i31.RegisterRepositoryImpl(gh<_i13.RegisterOnlineDatasource>()));
    gh.factory<_i32.LoginUsecase>(
        () => _i32.LoginUsecase(gh<_i28.LoginRepo>()));
    gh.factory<_i33.HomeRepository>(
        () => _i34.HomeRepositoryImpl(gh<_i15.RemoteDatasource>()));
    gh.factory<_i35.LoginViewModel>(
        () => _i35.LoginViewModel(gh<_i32.LoginUsecase>()));
    gh.factory<_i36.ForgetPasswordUsecase>(
        () => _i36.ForgetPasswordUsecase(gh<_i21.ForgetPasswordRepository>()));
    gh.factory<_i37.AuthRepository>(() => _i38.AuthRepositoryImpl(
          gh<_i23.AuthOnlineDatasource>(),
          gh<_i9.AuthOfflineDatasource>(),
        ));
    gh.factory<_i39.ProductDetailsUsecase>(
        () => _i39.ProductDetailsUsecase(gh<_i26.ProductDetailsRepository>()));
    gh.factory<_i40.GetAllBestSellerProductsUseCase>(
        () => _i40.GetAllBestSellerProductsUseCase(gh<_i33.HomeRepository>()));
    gh.factory<_i41.GetAllProductsUseCase>(
        () => _i41.GetAllProductsUseCase(gh<_i33.HomeRepository>()));
    gh.factory<_i42.GetCategoriesUsecase>(
        () => _i42.GetCategoriesUsecase(gh<_i33.HomeRepository>()));
    gh.factory<_i43.GetHomepageUsecase>(
        () => _i43.GetHomepageUsecase(gh<_i33.HomeRepository>()));
    gh.factory<_i44.ProductDetails_ViewModel>(
        () => _i44.ProductDetails_ViewModel(gh<_i39.ProductDetailsUsecase>()));
    gh.factory<_i45.RegisterUseCase>(
        () => _i45.RegisterUseCase(gh<_i30.RegisterRepository>()));
    gh.factory<_i46.RegisterViewModel>(() => _i46.RegisterViewModel(
          gh<_i45.RegisterUseCase>(),
          gh<_i6.RegisterValidator>(),
        ));
    gh.factory<_i47.ProductViewModel>(() => _i47.ProductViewModel(
          gh<_i41.GetAllProductsUseCase>(),
          gh<_i25.SharedPreferencesService>(),
          gh<_i40.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i48.ForegetPasswordViewmodel>(
        () => _i48.ForegetPasswordViewmodel(
              gh<_i36.ForgetPasswordUsecase>(),
              gh<_i4.ForgetPasswordValidator>(),
            ));
    gh.factory<_i49.HomeScreenViewmodel>(
        () => _i49.HomeScreenViewmodel(gh<_i43.GetHomepageUsecase>()));
    gh.factory<_i50.CategoriesViewmodel>(
        () => _i50.CategoriesViewmodel(gh<_i42.GetCategoriesUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {}

class _$DioModule extends _i51.DioModule {}
