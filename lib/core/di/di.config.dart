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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i710;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i988;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i568;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i983;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i334;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i661;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i67;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i699;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i707;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i823;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i760;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i694;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i877;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i61;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i14;
import '../../features/home/data/contracts/remote_datasource.dart' as _i92;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i958;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i87;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i629;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i321;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i953;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i728;
import '../../features/home/domain/usecase/get_categories_usecase.dart'
    as _i493;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i741;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i665;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i303;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i714;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i177;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i1061;
import '../network/api/api_manager.dart' as _i561;
import '../network/api/network_module.dart' as _i138;
import '../network/services/shared_preferences_service.dart' as _i262;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i375.ForgetPasswordValidator>(
        () => _i375.ForgetPasswordValidator());
    gh.factory<_i67.LoginValidator>(() => _i67.LoginValidator());
    gh.factory<_i877.RegisterValidator>(() => _i877.RegisterValidator());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i262.SharedPreferencesService>(
        () => _i262.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.singleton<_i561.ApiManager>(() => _i561.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i871.AuthOfflineDatasource>(
        () => _i601.AuthOfflineDatasourceImpl());
    gh.factory<_i14.ProductDetails_Onlinedatasource>(() =>
        _i958.ProductDetails_Onlinedatasource_Impl(gh<_i561.ApiManager>()));
    gh.factory<_i699.RegisterOnlineDatasource>(
        () => _i707.RegisterOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i92.RemoteDatasource>(
        () => _i87.RemoteDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i710.LoginOnlineDatasource>(
        () => _i988.LoginOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i267.ForgetPasswordOnlineDatasource>(
        () => _i460.ForgetPasswordOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i974.ForgetPasswordRepository>(() =>
        _i584.ForgetPasswordRepositoryImpl(
            gh<_i267.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i981.AuthOnlineDatasource>(
        () => _i849.AuthOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i321.ProductDetailsRepository>(() =>
        _i629.ProductDetailsRepoImpl(
            gh<_i14.ProductDetails_Onlinedatasource>()));
    gh.factory<_i983.LoginRepo>(
        () => _i568.LoginRepoImpl(gh<_i710.LoginOnlineDatasource>()));
    gh.factory<_i760.RegisterRepository>(() =>
        _i823.RegisterRepositoryImpl(gh<_i699.RegisterOnlineDatasource>()));
    gh.factory<_i334.LoginUsecase>(
        () => _i334.LoginUsecase(gh<_i983.LoginRepo>()));
    gh.factory<_i0.HomeRepository>(
        () => _i76.HomeRepositoryImpl(gh<_i92.RemoteDatasource>()));
    gh.factory<_i661.LoginViewModel>(
        () => _i661.LoginViewModel(gh<_i334.LoginUsecase>()));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i974.ForgetPasswordRepository>()));
    gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i981.AuthOnlineDatasource>(),
          gh<_i871.AuthOfflineDatasource>(),
        ));
    gh.factory<_i665.ProductDetailsUsecase>(() =>
        _i665.ProductDetailsUsecase(gh<_i321.ProductDetailsRepository>()));
    gh.factory<_i953.GetAllBestSellerProductsUseCase>(
        () => _i953.GetAllBestSellerProductsUseCase(gh<_i0.HomeRepository>()));
    gh.factory<_i728.GetAllProductsUseCase>(
        () => _i728.GetAllProductsUseCase(gh<_i0.HomeRepository>()));
    gh.factory<_i493.GetCategoriesUsecase>(
        () => _i493.GetCategoriesUsecase(gh<_i0.HomeRepository>()));
    gh.factory<_i741.GetOccasionsUsecase>(
        () => _i741.GetOccasionsUsecase(gh<_i0.HomeRepository>()));
    gh.factory<_i177.ProductDetails_ViewModel>(() =>
        _i177.ProductDetails_ViewModel(gh<_i665.ProductDetailsUsecase>()));
    gh.factory<_i694.RegisterUseCase>(
        () => _i694.RegisterUseCase(gh<_i760.RegisterRepository>()));
    gh.factory<_i61.RegisterViewModel>(() => _i61.RegisterViewModel(
          gh<_i694.RegisterUseCase>(),
          gh<_i877.RegisterValidator>(),
        ));
    gh.factory<_i1061.ProductViewModel>(() => _i1061.ProductViewModel(
          gh<_i728.GetAllProductsUseCase>(),
          gh<_i262.SharedPreferencesService>(),
          gh<_i953.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i455.ForegetPasswordViewmodel>(
        () => _i455.ForegetPasswordViewmodel(
              gh<_i995.ForgetPasswordUsecase>(),
              gh<_i375.ForgetPasswordValidator>(),
            ));
    gh.factory<_i303.CategoriesViewmodel>(
        () => _i303.CategoriesViewmodel(gh<_i493.GetCategoriesUsecase>()));
    gh.factory<_i714.OccasionsViewmodel>(
        () => _i714.OccasionsViewmodel(gh<_i741.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i262.RegisterModule {}

class _$DioModule extends _i138.DioModule {}
