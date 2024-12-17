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
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i41;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i14;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i42;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i69;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i68;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i37;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i38;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i40;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i39;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i66;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i86;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i6;
import '../../features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart'
    as _i29;
import '../../features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart'
    as _i30;
import '../../features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart'
    as _i51;
import '../../features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart'
    as _i50;
import '../../features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart'
    as _i81;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i33;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i34;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i49;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i48;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i54;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i87;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i7;
import '../../features/auth/logout/data/contracts/logout_online_datasource.dart'
    as _i21;
import '../../features/auth/logout/data/data_sources/logout_online_datasource_impl.dart'
    as _i22;
import '../../features/auth/logout/data/repos/logout_repo_impl.dart' as _i32;
import '../../features/auth/logout/domain/repos/logout_repo.dart' as _i31;
import '../../features/auth/logout/domain/use_cases/logout_usecase.dart'
    as _i67;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i23;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i24;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i53;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i52;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i83;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i8;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i84;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i35;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart'
    as _i36;
import '../../features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart'
    as _i65;
import '../../features/auth/update_password/domain/repository/update_password_repository.dart'
    as _i64;
import '../../features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i82;
import '../../features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i9;
import '../../features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart'
    as _i93;
import '../../features/Cart/data/contracts/cart_online_datasource.dart' as _i17;
import '../../features/Cart/data/datasources/cart_online_datasource_impl.dart'
    as _i18;
import '../../features/Cart/data/repos/cart_repository_impl.dart' as _i20;
import '../../features/Cart/domain/repos/cart_repository.dart' as _i19;
import '../../features/Cart/domain/usecases/add_product_to_cart_usecase.dart'
    as _i59;
import '../../features/Cart/domain/usecases/get_cart_usecase.dart' as _i60;
import '../../features/Cart/domain/usecases/remove_item_from_cart_usecase.dart'
    as _i61;
import '../../features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart'
    as _i62;
import '../../features/Cart/presentation/viewmodel/cart_view_model.dart'
    as _i63;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i15;
import '../../features/home/data/contracts/remote_datasource.dart' as _i27;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i16;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i28;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i56;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i47;
import '../../features/home/domain/repositories/home_repository.dart' as _i55;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i46;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i74;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i75;
import '../../features/home/domain/usecase/get_categories_usecase.dart' as _i76;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i77;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i73;
import '../../features/home/domain/usecase/save_user_address.dart' as _i70;
import '../../features/home/domain/usecase/update_user_data_usecase.dart'
    as _i71;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i78;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i79;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i91;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i92;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i88;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i95;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i80;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i89;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_validators.dart'
    as _i10;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart'
    as _i94;
import '../../features/home/presentation/profile_screen/profile_view_model/profile_view_model.dart'
    as _i85;
import '../../features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart'
    as _i90;
import '../../features/orders/data/contracts/orders_online_datasource.dart'
    as _i183;
import '../../features/orders/data/datasource/orders_online_datasource_impl.dart'
    as _i442;
import '../../features/orders/data/repos/orders_repository_impl.dart' as _i116;
import '../../features/orders/domain/repos/orders_repository.dart' as _i714;
import '../../features/orders/domain/usecases/get_orders_usecase.dart' as _i755;
import '../../features/orders/presentation/orders_view_model.dart' as _i844;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart'
    as _i25;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse_impl.dart'
    as _i26;
import '../../features/user_addresses/savedAddresses/data/repositoryImpl/address_repositoryImpl.dart'
    as _i44;
import '../../features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart'
    as _i43;
import '../../features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart'
    as _i57;
import '../../features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart'
    as _i58;
import '../../features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart'
    as _i72;
import '../cache/shared_preferences_service.dart' as _i45;
import '../network/api/api_manager.dart' as _i12;
import '../network/api/network_module.dart' as _i96;
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
    gh.factory<_i183.OrdersOnlineDatasource>(
        () => _i442.OrdersOnlineDatasourceImpl(gh<_i561.ApiManager>()));
    gh.factory<_i17.CartOnlineDatasource>(
        () => _i18.CartOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i19.CartRepository>(
        () => _i20.CartRepositoryImpl(gh<_i17.CartOnlineDatasource>()));
    gh.factory<_i21.LogoutOnlineDatasource>(
        () => _i22.LogoutOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i23.RegisterOnlineDatasource>(
        () => _i24.RegisterOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i25.AddressOnlineDatasource>(
        () => _i26.AddressOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i27.RemoteDatasource>(
        () => _i28.RemoteDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i29.GetLoggedUserDataOnlineDatasource>(() =>
        _i30.GetLoggedUserDataOnlineDataSourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i31.LogoutRepo>(
        () => _i32.LogoutRpoImpl(gh<_i21.LogoutOnlineDatasource>()));
    gh.factory<_i33.LoginOnlineDatasource>(
        () => _i34.LoginOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i35.UpdatePasswordOnlineDatasource>(
        () => _i36.UpdatePasswordOnlineDatasourceImpl(
              gh<_i12.ApiManager>(),
              gh<_i4.TokenProvider>(),
            ));
    gh.factory<_i37.ForgetPasswordOnlineDatasource>(
        () => _i38.ForgetPasswordOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i39.ForgetPasswordRepository>(() =>
        _i40.ForgetPasswordRepositoryImpl(
            gh<_i37.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i41.AuthOnlineDatasource>(
        () => _i42.AuthOnlineDatasourceImpl(gh<_i12.ApiManager>()));
    gh.factory<_i43.AddressesRepository>(
        () => _i44.AddressesRepositoryImpl(gh<_i25.AddressOnlineDatasource>()));
    gh.singleton<_i45.SharedPreferencesService>(
        () => _i45.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i46.ProductDetailsRepository>(() => _i47.ProductDetailsRepoImpl(
        gh<_i15.ProductDetails_Onlinedatasource>()));
    gh.factory<_i48.LoginRepo>(
        () => _i49.LoginRepoImpl(gh<_i33.LoginOnlineDatasource>()));
    gh.factory<_i50.GetLoggedUserDataRepo>(() => _i51.GetLoggedUserDataRepoImpl(
        gh<_i29.GetLoggedUserDataOnlineDatasource>()));
    gh.factory<_i52.RegisterRepository>(
        () => _i53.RegisterRepositoryImpl(gh<_i23.RegisterOnlineDatasource>()));
    gh.factory<_i714.OrdersRepository>(
        () => _i116.OrdersRepositoryImpl(gh<_i183.OrdersOnlineDatasource>()));
    gh.factory<_i54.LoginUsecase>(
        () => _i54.LoginUsecase(gh<_i48.LoginRepo>()));
    gh.factory<_i55.HomeRepository>(
        () => _i56.HomeRepositoryImpl(gh<_i27.RemoteDatasource>()));
    gh.factory<_i57.GetAddressesUsecase>(
        () => _i57.GetAddressesUsecase(gh<_i43.AddressesRepository>()));
    gh.factory<_i58.RemoveAddressUsecase>(
        () => _i58.RemoveAddressUsecase(gh<_i43.AddressesRepository>()));
    gh.factory<_i755.GetOrdersUsecase>(
        () => _i755.GetOrdersUsecase(gh<_i714.OrdersRepository>()));
    gh.factory<_i59.AddProductToCartUsecase>(
        () => _i59.AddProductToCartUsecase(gh<_i19.CartRepository>()));
    gh.factory<_i60.GetCartUsecase>(
        () => _i60.GetCartUsecase(gh<_i19.CartRepository>()));
    gh.factory<_i61.RemoveItemFromCartUsecase>(
        () => _i61.RemoveItemFromCartUsecase(gh<_i19.CartRepository>()));
    gh.factory<_i62.UpdateCartProductQuantityUsecase>(
        () => _i62.UpdateCartProductQuantityUsecase(gh<_i19.CartRepository>()));
    gh.factory<_i63.CartViewmodel>(() => _i63.CartViewmodel(
          gh<_i60.GetCartUsecase>(),
          gh<_i61.RemoveItemFromCartUsecase>(),
          gh<_i62.UpdateCartProductQuantityUsecase>(),
          gh<_i59.AddProductToCartUsecase>(),
          gh<_i4.TokenProvider>(),
        ));
    gh.factory<_i64.UpdatePasswordRepository>(() =>
        _i65.UpdatePasswordRepositoryImpl(
            gh<_i35.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i66.ForgetPasswordUsecase>(
        () => _i66.ForgetPasswordUsecase(gh<_i39.ForgetPasswordRepository>()));
    gh.factory<_i67.LogoutUsecase>(
        () => _i67.LogoutUsecase(gh<_i31.LogoutRepo>()));
    gh.factory<_i844.OrdersViewModel>(
        () => _i844.OrdersViewModel(gh<_i755.GetOrdersUsecase>()));
    gh.factory<_i68.AuthRepository>(() => _i69.AuthRepositoryImpl(
          gh<_i41.AuthOnlineDatasource>(),
          gh<_i13.AuthOfflineDatasource>(),
        ));
    gh.factory<_i70.SaveUserAddressUseCase>(
        () => _i70.SaveUserAddressUseCase(gh<_i55.HomeRepository>()));
    gh.factory<_i71.UpdateUserDataUseCase>(
        () => _i71.UpdateUserDataUseCase(gh<_i55.HomeRepository>()));
    gh.factory<_i72.AddressViewModel>(() => _i72.AddressViewModel(
          gh<_i57.GetAddressesUsecase>(),
          gh<_i58.RemoveAddressUsecase>(),
        ));
    gh.factory<_i73.ProductDetailsUsecase>(
        () => _i73.ProductDetailsUsecase(gh<_i46.ProductDetailsRepository>()));
    gh.factory<_i74.GetAllBestSellerProductsUseCase>(
        () => _i74.GetAllBestSellerProductsUseCase(gh<_i55.HomeRepository>()));
    gh.factory<_i75.GetAllProductsUseCase>(
        () => _i75.GetAllProductsUseCase(gh<_i55.HomeRepository>()));
    gh.factory<_i76.GetCategoriesUsecase>(
        () => _i76.GetCategoriesUsecase(gh<_i55.HomeRepository>()));
    gh.factory<_i77.GetOccasionsUsecase>(
        () => _i77.GetOccasionsUsecase(gh<_i55.HomeRepository>()));
    gh.factory<_i78.GetCategoriesUsecase>(
        () => _i78.GetCategoriesUsecase(gh<_i55.HomeRepository>()));
    gh.factory<_i79.GetHomepageUsecase>(
        () => _i79.GetHomepageUsecase(gh<_i55.HomeRepository>()));
    gh.factory<_i80.ProductDetails_ViewModel>(
        () => _i80.ProductDetails_ViewModel(gh<_i73.ProductDetailsUsecase>()));
    gh.factory<_i81.GetLogedUserDataUsecase>(
        () => _i81.GetLogedUserDataUsecase(gh<_i50.GetLoggedUserDataRepo>()));
    gh.factory<_i82.UpdatePasswordUseCase>(
        () => _i82.UpdatePasswordUseCase(gh<_i64.UpdatePasswordRepository>()));
    gh.factory<_i83.RegisterUseCase>(
        () => _i83.RegisterUseCase(gh<_i52.RegisterRepository>()));
    gh.factory<_i84.RegisterViewModel>(() => _i84.RegisterViewModel(
          gh<_i83.RegisterUseCase>(),
          gh<_i8.RegisterValidator>(),
        ));
    gh.factory<_i85.ProfileViewModel>(
        () => _i85.ProfileViewModel(gh<_i67.LogoutUsecase>()));
    gh.factory<_i86.ForegetPasswordViewmodel>(
        () => _i86.ForegetPasswordViewmodel(
              gh<_i66.ForgetPasswordUsecase>(),
              gh<_i6.ForgetPasswordValidator>(),
            ));
    gh.factory<_i87.LoginViewModel>(() => _i87.LoginViewModel(
          gh<_i54.LoginUsecase>(),
          gh<_i81.GetLogedUserDataUsecase>(),
        ));
    gh.factory<_i88.HomeScreenViewmodel>(
        () => _i88.HomeScreenViewmodel(gh<_i79.GetHomepageUsecase>()));
    gh.factory<_i89.ProductViewModel>(() => _i89.ProductViewModel(
          gh<_i75.GetAllProductsUseCase>(),
          gh<_i45.SharedPreferencesService>(),
          gh<_i74.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i90.SaveAddressViewModel>(
        () => _i90.SaveAddressViewModel(gh<_i70.SaveUserAddressUseCase>()));
    gh.factory<_i91.CategoriesViewmodel>(
        () => _i91.CategoriesViewmodel(gh<_i76.GetCategoriesUsecase>()));
    gh.factory<_i92.CategoriesViewmodel>(
        () => _i92.CategoriesViewmodel(gh<_i78.GetCategoriesUsecase>()));
    gh.factory<_i93.UpdatePasswordViewModel>(() => _i93.UpdatePasswordViewModel(
          gh<_i82.UpdatePasswordUseCase>(),
          gh<_i9.UpdatePasswordValidator>(),
          gh<_i67.LogoutUsecase>(),
        ));
    gh.factory<_i94.EditProfileScreenViewModel>(() =>
        _i94.EditProfileScreenViewModel(gh<_i71.UpdateUserDataUseCase>()));
    gh.factory<_i95.OccasionsViewmodel>(
        () => _i95.OccasionsViewmodel(gh<_i77.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i45.RegisterModule {}

class _$DioModule extends _i96.DioModule {}
