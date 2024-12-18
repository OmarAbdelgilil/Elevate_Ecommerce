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
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i43;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i14;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i44;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i75;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i74;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i39;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i40;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i42;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i41;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i71;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i92;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i6;
import '../../features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart'
    as _i31;
import '../../features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart'
    as _i32;
import '../../features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart'
    as _i53;
import '../../features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart'
    as _i52;
import '../../features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart'
    as _i87;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i35;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i36;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i51;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i50;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i58;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i93;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i7;
import '../../features/auth/logout/data/contracts/logout_online_datasource.dart'
    as _i23;
import '../../features/auth/logout/data/data_sources/logout_online_datasource_impl.dart'
    as _i24;
import '../../features/auth/logout/data/repos/logout_repo_impl.dart' as _i34;
import '../../features/auth/logout/domain/repos/logout_repo.dart' as _i33;
import '../../features/auth/logout/domain/use_cases/logout_usecase.dart'
    as _i72;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i25;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i26;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i55;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i54;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i89;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i8;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i90;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i37;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart'
    as _i38;
import '../../features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart'
    as _i70;
import '../../features/auth/update_password/domain/repository/update_password_repository.dart'
    as _i69;
import '../../features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i88;
import '../../features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i9;
import '../../features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart'
    as _i99;
import '../../features/Cart/data/contracts/cart_online_datasource.dart' as _i19;
import '../../features/Cart/data/datasources/cart_online_datasource_impl.dart'
    as _i20;
import '../../features/Cart/data/repos/cart_repository_impl.dart' as _i22;
import '../../features/Cart/domain/repos/cart_repository.dart' as _i21;
import '../../features/Cart/domain/usecases/add_product_to_cart_usecase.dart'
    as _i64;
import '../../features/Cart/domain/usecases/get_cart_usecase.dart' as _i65;
import '../../features/Cart/domain/usecases/remove_item_from_cart_usecase.dart'
    as _i66;
import '../../features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart'
    as _i67;
import '../../features/Cart/presentation/viewmodel/cart_view_model.dart'
    as _i68;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i15;
import '../../features/home/data/contracts/remote_datasource.dart' as _i29;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i16;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i30;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i60;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i49;
import '../../features/home/domain/repositories/home_repository.dart' as _i59;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i48;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i80;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i81;
import '../../features/home/domain/usecase/get_categories_usecase.dart' as _i82;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i83;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i79;
import '../../features/home/domain/usecase/save_user_address.dart' as _i76;
import '../../features/home/domain/usecase/update_user_data_usecase.dart'
    as _i77;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i84;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i85;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i97;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i98;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i94;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i101;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i86;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i95;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_validators.dart'
    as _i10;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart'
    as _i100;
import '../../features/home/presentation/profile_screen/profile_view_model/profile_view_model.dart'
    as _i91;
import '../../features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart'
    as _i96;
import '../../features/orders/data/contracts/orders_online_datasource.dart'
    as _i17;
import '../../features/orders/data/datasource/orders_online_datasource_impl.dart'
    as _i18;
import '../../features/orders/data/repos/orders_repository_impl.dart' as _i57;
import '../../features/orders/domain/repos/orders_repository.dart' as _i56;
import '../../features/orders/domain/usecases/get_orders_usecase.dart' as _i63;
import '../../features/orders/presentation/orders_view_model.dart' as _i73;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart'
    as _i27;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse_impl.dart'
    as _i28;
import '../../features/user_addresses/savedAddresses/data/repositoryImpl/address_repositoryImpl.dart'
    as _i46;
import '../../features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart'
    as _i45;
import '../../features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart'
    as _i61;
import '../../features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart'
    as _i62;
import '../../features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart'
    as _i78;
import '../cache/shared_preferences_service.dart' as _i47;
import '../network/api/api_manager.dart' as _i12;
import '../network/api/network_module.dart' as _i102;
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
    gh.factory<_i15.ProductDetails_Onlinedatasource>(
        () => _i16.ProductDetails_Onlinedatasource_Impl(gh<_i12.ApiManager>()));
    gh.factory<_i17.OrdersOnlineDatasource>(
        () => _i18.OrdersOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i19.CartOnlineDatasource>(
        () => _i20.CartOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i21.CartRepository>(
        () => _i22.CartRepositoryImpl(gh<_i19.CartOnlineDatasource>()));
    gh.factory<_i23.LogoutOnlineDatasource>(
        () => _i24.LogoutOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i25.RegisterOnlineDatasource>(
        () => _i26.RegisterOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i27.AddressOnlineDatasource>(
        () => _i28.AddressOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i29.RemoteDatasource>(
        () => _i30.RemoteDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i31.GetLoggedUserDataOnlineDatasource>(() =>
        _i32.GetLoggedUserDataOnlineDataSourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i33.LogoutRepo>(
        () => _i34.LogoutRpoImpl(gh<_i23.LogoutOnlineDatasource>()));
    gh.factory<_i35.LoginOnlineDatasource>(
        () => _i36.LoginOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i37.UpdatePasswordOnlineDatasource>(
        () => _i38.UpdatePasswordOnlineDatasourceImpl(
              gh<_i12.ApiManager>(),
              gh<_i4.TokenProvider>(),
            ));
    gh.factory<_i39.ForgetPasswordOnlineDatasource>(
        () => _i40.ForgetPasswordOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i41.ForgetPasswordRepository>(() =>
        _i42.ForgetPasswordRepositoryImpl(
            gh<_i39.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i43.AuthOnlineDatasource>(
        () => _i44.AuthOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i45.AddressesRepository>(
        () => _i46.AddressesRepositoryImpl(gh<_i27.AddressOnlineDatasource>()));
    gh.singleton<_i47.SharedPreferencesService>(
        () => _i47.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i48.ProductDetailsRepository>(() => _i49.ProductDetailsRepoImpl(
        gh<_i15.ProductDetails_Onlinedatasource>()));
    gh.factory<_i50.LoginRepo>(
        () => _i51.LoginRepoImpl(gh<_i35.LoginOnlineDatasource>()));
    gh.factory<_i52.GetLoggedUserDataRepo>(() => _i53.GetLoggedUserDataRepoImpl(
        gh<_i31.GetLoggedUserDataOnlineDatasource>()));
    gh.factory<_i54.RegisterRepository>(
        () => _i55.RegisterRepositoryImpl(gh<_i25.RegisterOnlineDatasource>()));
    gh.factory<_i56.OrdersRepository>(
        () => _i57.OrdersRepositoryImpl(gh<_i17.OrdersOnlineDatasource>()));
    gh.factory<_i58.LoginUsecase>(
        () => _i58.LoginUsecase(gh<_i50.LoginRepo>()));
    gh.factory<_i59.HomeRepository>(
        () => _i60.HomeRepositoryImpl(gh<_i29.RemoteDatasource>()));
    gh.factory<_i61.GetAddressesUsecase>(
        () => _i61.GetAddressesUsecase(gh<_i45.AddressesRepository>()));
    gh.factory<_i62.RemoveAddressUsecase>(
        () => _i62.RemoveAddressUsecase(gh<_i45.AddressesRepository>()));
    gh.factory<_i63.GetOrdersUsecase>(
        () => _i63.GetOrdersUsecase(gh<_i56.OrdersRepository>()));
    gh.factory<_i64.AddProductToCartUsecase>(
        () => _i64.AddProductToCartUsecase(gh<_i21.CartRepository>()));
    gh.factory<_i65.GetCartUsecase>(
        () => _i65.GetCartUsecase(gh<_i21.CartRepository>()));
    gh.factory<_i66.RemoveItemFromCartUsecase>(
        () => _i66.RemoveItemFromCartUsecase(gh<_i21.CartRepository>()));
    gh.factory<_i67.UpdateCartProductQuantityUsecase>(
        () => _i67.UpdateCartProductQuantityUsecase(gh<_i21.CartRepository>()));
    gh.factory<_i68.CartViewmodel>(() => _i68.CartViewmodel(
          gh<_i65.GetCartUsecase>(),
          gh<_i66.RemoveItemFromCartUsecase>(),
          gh<_i67.UpdateCartProductQuantityUsecase>(),
          gh<_i64.AddProductToCartUsecase>(),
          gh<_i4.TokenProvider>(),
        ));
    gh.factory<_i69.UpdatePasswordRepository>(() =>
        _i70.UpdatePasswordRepositoryImpl(
            gh<_i37.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i71.ForgetPasswordUsecase>(
        () => _i71.ForgetPasswordUsecase(gh<_i41.ForgetPasswordRepository>()));
    gh.factory<_i72.LogoutUsecase>(
        () => _i72.LogoutUsecase(gh<_i33.LogoutRepo>()));
    gh.factory<_i73.OrdersViewModel>(
        () => _i73.OrdersViewModel(gh<_i63.GetOrdersUsecase>()));
    gh.factory<_i74.AuthRepository>(() => _i75.AuthRepositoryImpl(
          gh<_i43.AuthOnlineDatasource>(),
          gh<_i13.AuthOfflineDatasource>(),
        ));
    gh.factory<_i76.SaveUserAddressUseCase>(
        () => _i76.SaveUserAddressUseCase(gh<_i59.HomeRepository>()));
    gh.factory<_i77.UpdateUserDataUseCase>(
        () => _i77.UpdateUserDataUseCase(gh<_i59.HomeRepository>()));
    gh.factory<_i78.AddressViewModel>(() => _i78.AddressViewModel(
          gh<_i61.GetAddressesUsecase>(),
          gh<_i62.RemoveAddressUsecase>(),
        ));
    gh.factory<_i79.ProductDetailsUsecase>(
        () => _i79.ProductDetailsUsecase(gh<_i48.ProductDetailsRepository>()));
    gh.factory<_i80.GetAllBestSellerProductsUseCase>(
        () => _i80.GetAllBestSellerProductsUseCase(gh<_i59.HomeRepository>()));
    gh.factory<_i81.GetAllProductsUseCase>(
        () => _i81.GetAllProductsUseCase(gh<_i59.HomeRepository>()));
    gh.factory<_i82.GetCategoriesUsecase>(
        () => _i82.GetCategoriesUsecase(gh<_i59.HomeRepository>()));
    gh.factory<_i83.GetOccasionsUsecase>(
        () => _i83.GetOccasionsUsecase(gh<_i59.HomeRepository>()));
    gh.factory<_i84.GetCategoriesUsecase>(
        () => _i84.GetCategoriesUsecase(gh<_i59.HomeRepository>()));
    gh.factory<_i85.GetHomepageUsecase>(
        () => _i85.GetHomepageUsecase(gh<_i59.HomeRepository>()));
    gh.factory<_i86.ProductDetails_ViewModel>(
        () => _i86.ProductDetails_ViewModel(gh<_i79.ProductDetailsUsecase>()));
    gh.factory<_i87.GetLogedUserDataUsecase>(
        () => _i87.GetLogedUserDataUsecase(gh<_i52.GetLoggedUserDataRepo>()));
    gh.factory<_i88.UpdatePasswordUseCase>(
        () => _i88.UpdatePasswordUseCase(gh<_i69.UpdatePasswordRepository>()));
    gh.factory<_i89.RegisterUseCase>(
        () => _i89.RegisterUseCase(gh<_i54.RegisterRepository>()));
    gh.factory<_i90.RegisterViewModel>(() => _i90.RegisterViewModel(
          gh<_i89.RegisterUseCase>(),
          gh<_i8.RegisterValidator>(),
        ));
    gh.factory<_i91.ProfileViewModel>(
        () => _i91.ProfileViewModel(gh<_i72.LogoutUsecase>()));
    gh.factory<_i92.ForegetPasswordViewmodel>(
        () => _i92.ForegetPasswordViewmodel(
              gh<_i71.ForgetPasswordUsecase>(),
              gh<_i6.ForgetPasswordValidator>(),
            ));
    gh.factory<_i93.LoginViewModel>(() => _i93.LoginViewModel(
          gh<_i58.LoginUsecase>(),
          gh<_i87.GetLogedUserDataUsecase>(),
        ));
    gh.factory<_i94.HomeScreenViewmodel>(
        () => _i94.HomeScreenViewmodel(gh<_i85.GetHomepageUsecase>()));
    gh.factory<_i95.ProductViewModel>(() => _i95.ProductViewModel(
          gh<_i81.GetAllProductsUseCase>(),
          gh<_i47.SharedPreferencesService>(),
          gh<_i80.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i96.SaveAddressViewModel>(
        () => _i96.SaveAddressViewModel(gh<_i76.SaveUserAddressUseCase>()));
    gh.factory<_i97.CategoriesViewmodel>(
        () => _i97.CategoriesViewmodel(gh<_i82.GetCategoriesUsecase>()));
    gh.factory<_i98.CategoriesViewmodel>(
        () => _i98.CategoriesViewmodel(gh<_i84.GetCategoriesUsecase>()));
    gh.factory<_i99.UpdatePasswordViewModel>(() => _i99.UpdatePasswordViewModel(
          gh<_i88.UpdatePasswordUseCase>(),
          gh<_i9.UpdatePasswordValidator>(),
          gh<_i72.LogoutUsecase>(),
        ));
    gh.factory<_i100.EditProfileScreenViewModel>(() =>
        _i100.EditProfileScreenViewModel(gh<_i77.UpdateUserDataUseCase>()));
    gh.factory<_i101.OccasionsViewmodel>(
        () => _i101.OccasionsViewmodel(gh<_i83.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i47.RegisterModule {}

class _$DioModule extends _i102.DioModule {}
