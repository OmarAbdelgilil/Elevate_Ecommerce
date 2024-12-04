// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/contracts/auth_offline_datasource.dart'
    as _i12;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i28;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i13;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i29;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i44;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i43;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i24;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i25;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i27;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i26;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i42;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i57;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i4;
import '../../features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart'
    as _i20;
import '../../features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart'
    as _i21;
import '../../features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart'
    as _i36;
import '../../features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart'
    as _i35;
import '../../features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart'
    as _i54;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i22;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i23;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i34;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i33;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i39;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i58;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i5;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i16;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i17;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i38;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i37;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i55;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i6;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i56;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i14;
import '../../features/home/data/contracts/remote_datasource.dart' as _i18;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i15;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i19;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i41;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i32;
import '../../features/home/domain/repositories/home_repository.dart' as _i40;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i31;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i47;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i48;
import '../../features/home/domain/usecase/get_categories_usecase.dart' as _i49;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i50;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i46;
import '../../features/home/domain/usecase/update_user_data_usecase.dart'
    as _i45;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i51;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i52;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i61;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i62;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i59;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i64;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i53;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i60;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_validators.dart'
    as _i7;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart'
    as _i63;
import '../cache/shared_preferences_service.dart' as _i30;
import '../network/api/api_manager.dart' as _i11;
import '../network/api/network_module.dart' as _i65;
import '../providers/token_provider.dart' as _i8;
import '../providers/user_provider.dart' as _i9;

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
    gh.factory<_i7.EditProfileValidator>(() => _i7.EditProfileValidator());
    gh.singleton<_i8.TokenProvider>(() => _i8.TokenProvider());
    gh.singleton<_i9.UserProvider>(() => _i9.UserProvider());
    gh.lazySingleton<_i10.Dio>(() => dioModule.provideDio());
    gh.singleton<_i11.ApiManager>(() => _i11.ApiManager(
          gh<_i10.Dio>(),
          gh<_i8.TokenProvider>(),
        ));
    gh.factory<_i12.AuthOfflineDatasource>(
        () => _i13.AuthOfflineDatasourceImpl());
    gh.factory<_i14.ProductDetails_Onlinedatasource>(
        () => _i15.ProductDetails_Onlinedatasource_Impl(gh<_i11.ApiManager>()));
    gh.factory<_i16.RegisterOnlineDatasource>(
        () => _i17.RegisterOnlineDatasourceImpl(gh<_i11.ApiManager>()));
    gh.factory<_i18.RemoteDatasource>(
        () => _i19.RemoteDatasourceImpl(gh<_i11.ApiManager>()));
    gh.factory<_i20.GetLoggedUserDataOnlineDatasource>(() =>
        _i21.GetLoggedUserDataOnlineDataSourceImpl(gh<_i11.ApiManager>()));
    gh.factory<_i22.LoginOnlineDatasource>(
        () => _i23.LoginOnlineDatasourceImpl(gh<_i11.ApiManager>()));
    gh.factory<_i24.ForgetPasswordOnlineDatasource>(
        () => _i25.ForgetPasswordOnlineDatasourceImpl(gh<_i11.ApiManager>()));
    gh.factory<_i26.ForgetPasswordRepository>(() =>
        _i27.ForgetPasswordRepositoryImpl(
            gh<_i24.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i28.AuthOnlineDatasource>(
        () => _i29.AuthOnlineDatasourceImpl(gh<_i11.ApiManager>()));
    gh.singleton<_i30.SharedPreferencesService>(
        () => _i30.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i31.ProductDetailsRepository>(() => _i32.ProductDetailsRepoImpl(
        gh<_i14.ProductDetails_Onlinedatasource>()));
    gh.factory<_i33.LoginRepo>(
        () => _i34.LoginRepoImpl(gh<_i22.LoginOnlineDatasource>()));
    gh.factory<_i35.GetLoggedUserDataRepo>(() => _i36.GetLoggedUserDataRepoImpl(
        gh<_i20.GetLoggedUserDataOnlineDatasource>()));
    gh.factory<_i37.RegisterRepository>(
        () => _i38.RegisterRepositoryImpl(gh<_i16.RegisterOnlineDatasource>()));
    gh.factory<_i39.LoginUsecase>(
        () => _i39.LoginUsecase(gh<_i33.LoginRepo>()));
    gh.factory<_i40.HomeRepository>(
        () => _i41.HomeRepositoryImpl(gh<_i18.RemoteDatasource>()));
    gh.factory<_i42.ForgetPasswordUsecase>(
        () => _i42.ForgetPasswordUsecase(gh<_i26.ForgetPasswordRepository>()));
    gh.factory<_i43.AuthRepository>(() => _i44.AuthRepositoryImpl(
          gh<_i28.AuthOnlineDatasource>(),
          gh<_i12.AuthOfflineDatasource>(),
        ));
    gh.factory<_i45.UpdateUserDataUseCase>(
        () => _i45.UpdateUserDataUseCase(gh<_i40.HomeRepository>()));
    gh.factory<_i46.ProductDetailsUsecase>(
        () => _i46.ProductDetailsUsecase(gh<_i31.ProductDetailsRepository>()));
    gh.factory<_i47.GetAllBestSellerProductsUseCase>(
        () => _i47.GetAllBestSellerProductsUseCase(gh<_i40.HomeRepository>()));
    gh.factory<_i48.GetAllProductsUseCase>(
        () => _i48.GetAllProductsUseCase(gh<_i40.HomeRepository>()));
    gh.factory<_i49.GetCategoriesUsecase>(
        () => _i49.GetCategoriesUsecase(gh<_i40.HomeRepository>()));
    gh.factory<_i50.GetOccasionsUsecase>(
        () => _i50.GetOccasionsUsecase(gh<_i40.HomeRepository>()));
    gh.factory<_i51.GetCategoriesUsecase>(
        () => _i51.GetCategoriesUsecase(gh<_i40.HomeRepository>()));
    gh.factory<_i52.GetHomepageUsecase>(
        () => _i52.GetHomepageUsecase(gh<_i40.HomeRepository>()));
    gh.factory<_i53.ProductDetails_ViewModel>(
        () => _i53.ProductDetails_ViewModel(gh<_i46.ProductDetailsUsecase>()));
    gh.factory<_i54.GetLogedUserDataUsecase>(
        () => _i54.GetLogedUserDataUsecase(gh<_i35.GetLoggedUserDataRepo>()));
    gh.factory<_i55.RegisterUseCase>(
        () => _i55.RegisterUseCase(gh<_i37.RegisterRepository>()));
    gh.factory<_i56.RegisterViewModel>(() => _i56.RegisterViewModel(
          gh<_i55.RegisterUseCase>(),
          gh<_i6.RegisterValidator>(),
        ));
    gh.factory<_i57.ForegetPasswordViewmodel>(
        () => _i57.ForegetPasswordViewmodel(
              gh<_i42.ForgetPasswordUsecase>(),
              gh<_i4.ForgetPasswordValidator>(),
            ));
    gh.factory<_i58.LoginViewModel>(() => _i58.LoginViewModel(
          gh<_i39.LoginUsecase>(),
          gh<_i54.GetLogedUserDataUsecase>(),
        ));
    gh.factory<_i59.HomeScreenViewmodel>(
        () => _i59.HomeScreenViewmodel(gh<_i52.GetHomepageUsecase>()));
    gh.factory<_i60.ProductViewModel>(() => _i60.ProductViewModel(
          gh<_i48.GetAllProductsUseCase>(),
          gh<_i30.SharedPreferencesService>(),
          gh<_i47.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i61.CategoriesViewmodel>(
        () => _i61.CategoriesViewmodel(gh<_i49.GetCategoriesUsecase>()));
    gh.factory<_i62.CategoriesViewmodel>(
        () => _i62.CategoriesViewmodel(gh<_i51.GetCategoriesUsecase>()));
    gh.factory<_i63.EditProfileScreenViewModel>(() =>
        _i63.EditProfileScreenViewModel(gh<_i45.UpdateUserDataUseCase>()));
    gh.factory<_i64.OccasionsViewmodel>(
        () => _i64.OccasionsViewmodel(gh<_i50.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i30.RegisterModule {}

class _$DioModule extends _i65.DioModule {}
