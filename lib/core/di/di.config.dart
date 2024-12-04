// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/contracts/auth_offline_datasource.dart'
    as _i13;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i33;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i14;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i34;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i51;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i50;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i29;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i30;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i32;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i31;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i49;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i64;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i6;
import '../../features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart'
    as _i25;
import '../../features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart'
    as _i26;
import '../../features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart'
    as _i42;
import '../../features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart'
    as _i41;
import '../../features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart'
    as _i61;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i27;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i28;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i40;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i39;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i45;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i65;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i7;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i21;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i22;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i44;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i43;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i62;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i8;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i63;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i15;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart'
    as _i16;
import '../../features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart'
    as _i20;
import '../../features/auth/update_password/domain/repository/update_password_repository.dart'
    as _i19;
import '../../features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i38;
import '../../features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i9;
import '../../features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart'
    as _i48;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i17;
import '../../features/home/data/contracts/remote_datasource.dart' as _i23;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i18;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i24;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i47;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i37;
import '../../features/home/domain/repositories/home_repository.dart' as _i46;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i36;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i54;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i55;
import '../../features/home/domain/usecase/get_categories_usecase.dart' as _i56;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i57;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i53;
import '../../features/home/domain/usecase/update_user_data_usecase.dart'
    as _i52;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i58;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i59;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i68;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i69;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i66;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i71;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i60;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i67;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_validators.dart'
    as _i10;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart'
    as _i70;
import '../cache/shared_preferences_service.dart' as _i35;
import '../network/api/api_manager.dart' as _i12;
import '../network/api/network_module.dart' as _i72;
import '../providers/token_provider.dart' as _i4;
import '../providers/user_provider.dart' as _i5;

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
    gh.factory<_i4.TokenProvider>(() => _i4.TokenProvider());
    gh.factory<_i5.UserProvider>(() => _i5.UserProvider());
    gh.factory<_i6.ForgetPasswordValidator>(
        () => _i6.ForgetPasswordValidator());
    gh.factory<_i7.LoginValidator>(() => _i7.LoginValidator());
    gh.factory<_i8.RegisterValidator>(() => _i8.RegisterValidator());
    gh.factory<_i9.UpdatePasswordValidator>(
        () => _i9.UpdatePasswordValidator());
    gh.factory<_i10.EditProfileValidator>(() => _i10.EditProfileValidator());
    gh.lazySingleton<_i11.Dio>(() => dioModule.provideDio());
    gh.singleton<_i12.ApiManager>(() => _i12.ApiManager(
          gh<_i11.Dio>(),
          gh<_i4.TokenProvider>(),
        ));
    gh.factory<_i13.AuthOfflineDatasource>(
        () => _i14.AuthOfflineDatasourceImpl());
    gh.factory<_i15.UpdatePasswordOnlineDatasource>(
        () => _i16.UpdatePasswordOnlineDatasourceImpl(
              gh<_i12.ApiManager>(),
              gh<_i4.TokenProvider>(),
            ));
    gh.factory<_i17.ProductDetails_Onlinedatasource>(
        () => _i18.ProductDetails_Onlinedatasource_Impl(gh<_i12.ApiManager>()));
    gh.factory<_i19.UpdatePasswordRepository>(() =>
        _i20.UpdatePasswordRepositoryImpl(
            gh<_i15.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i21.RegisterOnlineDatasource>(
        () => _i22.RegisterOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i23.RemoteDatasource>(
        () => _i24.RemoteDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i25.GetLoggedUserDataOnlineDatasource>(() =>
        _i26.GetLoggedUserDataOnlineDataSourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i27.LoginOnlineDatasource>(
        () => _i28.LoginOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i29.ForgetPasswordOnlineDatasource>(
        () => _i30.ForgetPasswordOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i31.ForgetPasswordRepository>(() =>
        _i32.ForgetPasswordRepositoryImpl(
            gh<_i29.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i33.AuthOnlineDatasource>(
        () => _i34.AuthOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.singleton<_i35.SharedPreferencesService>(
        () => _i35.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i36.ProductDetailsRepository>(() => _i37.ProductDetailsRepoImpl(
        gh<_i17.ProductDetails_Onlinedatasource>()));
    gh.factory<_i38.UpdatePasswordUseCase>(
        () => _i38.UpdatePasswordUseCase(gh<_i19.UpdatePasswordRepository>()));
    gh.factory<_i39.LoginRepo>(
        () => _i40.LoginRepoImpl(gh<_i27.LoginOnlineDatasource>()));
    gh.factory<_i41.GetLoggedUserDataRepo>(() => _i42.GetLoggedUserDataRepoImpl(
        gh<_i25.GetLoggedUserDataOnlineDatasource>()));
    gh.factory<_i43.RegisterRepository>(
        () => _i44.RegisterRepositoryImpl(gh<_i21.RegisterOnlineDatasource>()));
    gh.factory<_i45.LoginUsecase>(
        () => _i45.LoginUsecase(gh<_i39.LoginRepo>()));
    gh.factory<_i46.HomeRepository>(
        () => _i47.HomeRepositoryImpl(gh<_i23.RemoteDatasource>()));
    gh.factory<_i48.UpdatePasswordViewModel>(() => _i48.UpdatePasswordViewModel(
          gh<_i38.UpdatePasswordUseCase>(),
          gh<_i9.UpdatePasswordValidator>(),
        ));
    gh.factory<_i49.ForgetPasswordUsecase>(
        () => _i49.ForgetPasswordUsecase(gh<_i31.ForgetPasswordRepository>()));
    gh.factory<_i50.AuthRepository>(() => _i51.AuthRepositoryImpl(
          gh<_i33.AuthOnlineDatasource>(),
          gh<_i13.AuthOfflineDatasource>(),
        ));
    gh.factory<_i52.UpdateUserDataUseCase>(
        () => _i52.UpdateUserDataUseCase(gh<_i46.HomeRepository>()));
    gh.factory<_i53.ProductDetailsUsecase>(
        () => _i53.ProductDetailsUsecase(gh<_i36.ProductDetailsRepository>()));
    gh.factory<_i54.GetAllBestSellerProductsUseCase>(
        () => _i54.GetAllBestSellerProductsUseCase(gh<_i46.HomeRepository>()));
    gh.factory<_i55.GetAllProductsUseCase>(
        () => _i55.GetAllProductsUseCase(gh<_i46.HomeRepository>()));
    gh.factory<_i56.GetCategoriesUsecase>(
        () => _i56.GetCategoriesUsecase(gh<_i46.HomeRepository>()));
    gh.factory<_i57.GetOccasionsUsecase>(
        () => _i57.GetOccasionsUsecase(gh<_i46.HomeRepository>()));
    gh.factory<_i58.GetCategoriesUsecase>(
        () => _i58.GetCategoriesUsecase(gh<_i46.HomeRepository>()));
    gh.factory<_i59.GetHomepageUsecase>(
        () => _i59.GetHomepageUsecase(gh<_i46.HomeRepository>()));
    gh.factory<_i60.ProductDetails_ViewModel>(
        () => _i60.ProductDetails_ViewModel(gh<_i53.ProductDetailsUsecase>()));
    gh.factory<_i61.GetLogedUserDataUsecase>(
        () => _i61.GetLogedUserDataUsecase(gh<_i41.GetLoggedUserDataRepo>()));
    gh.factory<_i62.RegisterUseCase>(
        () => _i62.RegisterUseCase(gh<_i43.RegisterRepository>()));
    gh.factory<_i63.RegisterViewModel>(() => _i63.RegisterViewModel(
          gh<_i62.RegisterUseCase>(),
          gh<_i8.RegisterValidator>(),
        ));
    gh.factory<_i64.ForegetPasswordViewmodel>(
        () => _i64.ForegetPasswordViewmodel(
              gh<_i49.ForgetPasswordUsecase>(),
              gh<_i6.ForgetPasswordValidator>(),
            ));
    gh.factory<_i65.LoginViewModel>(() => _i65.LoginViewModel(
          gh<_i45.LoginUsecase>(),
          gh<_i61.GetLogedUserDataUsecase>(),
        ));
    gh.factory<_i66.HomeScreenViewmodel>(
        () => _i66.HomeScreenViewmodel(gh<_i59.GetHomepageUsecase>()));
    gh.factory<_i67.ProductViewModel>(() => _i67.ProductViewModel(
          gh<_i55.GetAllProductsUseCase>(),
          gh<_i35.SharedPreferencesService>(),
          gh<_i54.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i68.CategoriesViewmodel>(
        () => _i68.CategoriesViewmodel(gh<_i56.GetCategoriesUsecase>()));
    gh.factory<_i69.CategoriesViewmodel>(
        () => _i69.CategoriesViewmodel(gh<_i58.GetCategoriesUsecase>()));
    gh.factory<_i70.EditProfileScreenViewModel>(() =>
        _i70.EditProfileScreenViewModel(gh<_i52.UpdateUserDataUseCase>()));
    gh.factory<_i71.OccasionsViewmodel>(
        () => _i71.OccasionsViewmodel(gh<_i57.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i35.RegisterModule {}

class _$DioModule extends _i72.DioModule {}
