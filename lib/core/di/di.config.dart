// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/auth/data/contracts/auth_offline_datasource.dart'
    as _i15;
import '../../features/auth/data/contracts/auth_online_datasource.dart' as _i54;
import '../../features/auth/data/data_sources/auth_offline_datasource_impl.dart'
    as _i16;
import '../../features/auth/data/data_sources/auth_online_datasource_impl.dart'
    as _i55;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i92;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i91;
import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i50;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i51;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i53;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i52;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i84;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i111;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i6;
import '../../features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart'
    as _i34;
import '../../features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart'
    as _i35;
import '../../features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart'
    as _i66;
import '../../features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart'
    as _i65;
import '../../features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart'
    as _i105;
import '../../features/auth/login/data/contracts/login_online_datasource.dart'
    as _i42;
import '../../features/auth/login/data/data_sources/login_online_datasource_impl.dart'
    as _i43;
import '../../features/auth/login/data/repos/login_repo_impl.dart' as _i64;
import '../../features/auth/login/domain/repos/login_repo.dart' as _i63;
import '../../features/auth/login/domain/use_cases/login_usecase.dart' as _i71;
import '../../features/auth/login/presentation/cubit/login_viewmodel.dart'
    as _i112;
import '../../features/auth/login/presentation/login_validator/login_validator.dart'
    as _i7;
import '../../features/auth/logout/data/contracts/logout_online_datasource.dart'
    as _i25;
import '../../features/auth/logout/data/data_sources/logout_online_datasource_impl.dart'
    as _i26;
import '../../features/auth/logout/data/repos/logout_repo_impl.dart' as _i39;
import '../../features/auth/logout/domain/repos/logout_repo.dart' as _i38;
import '../../features/auth/logout/domain/use_cases/logout_usecase.dart'
    as _i87;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource.dart'
    as _i27;
import '../../features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart'
    as _i28;
import '../../features/auth/Register/data/repository_impl/register_repository_impl.dart'
    as _i68;
import '../../features/auth/Register/domain/repository/register_repository.dart'
    as _i67;
import '../../features/auth/Register/domain/useCases/register_useCase.dart'
    as _i107;
import '../../features/auth/Register/presentation/Register_validator/register_validator.dart'
    as _i8;
import '../../features/auth/Register/presentation/Register_viewModel/register_viewModel.dart'
    as _i108;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i46;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart'
    as _i47;
import '../../features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart'
    as _i83;
import '../../features/auth/update_password/domain/repository/update_password_repository.dart'
    as _i82;
import '../../features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i106;
import '../../features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i9;
import '../../features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart'
    as _i118;
import '../../features/Cart/data/contracts/cart_online_datasource.dart' as _i21;
import '../../features/Cart/data/datasources/cart_online_datasource_impl.dart'
    as _i22;
import '../../features/Cart/data/repos/cart_repository_impl.dart' as _i24;
import '../../features/Cart/domain/repos/cart_repository.dart' as _i23;
import '../../features/Cart/domain/usecases/add_product_to_cart_usecase.dart'
    as _i77;
import '../../features/Cart/domain/usecases/get_cart_usecase.dart' as _i78;
import '../../features/Cart/domain/usecases/remove_item_from_cart_usecase.dart'
    as _i79;
import '../../features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart'
    as _i80;
import '../../features/Cart/presentation/viewmodel/cart_view_model.dart'
    as _i81;
import '../../features/chat/data/repo_impl/chat_repo_impl.dart' as _i13;
import '../../features/chat/data/sl/registered.dart' as _i122;
import '../../features/chat/domain/repo/chat_repo.dart' as _i29;
import '../../features/chat/domain/use_cases/get_messages_use_case.dart'
    as _i59;
import '../../features/chat/domain/use_cases/send_message_use_case.dart'
    as _i60;
import '../../features/home/data/contracts/product_details_onlineDataSource.dart'
    as _i17;
import '../../features/home/data/contracts/remote_datasource.dart' as _i32;
import '../../features/home/data/data_sources/product_details_onlineDataSource_impl.dart'
    as _i18;
import '../../features/home/data/data_sources/remote_datasource_impl.dart'
    as _i33;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i73;
import '../../features/home/data/repositories/product_details_repo_impl.dart'
    as _i62;
import '../../features/home/domain/repositories/home_repository.dart' as _i72;
import '../../features/home/domain/repositories/product_details_repository.dart'
    as _i61;
import '../../features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i97;
import '../../features/home/domain/usecase/get_all_products_usecase.dart'
    as _i98;
import '../../features/home/domain/usecase/get_categories_usecase.dart' as _i99;
import '../../features/home/domain/usecase/get_occations_usecase.dart' as _i100;
import '../../features/home/domain/usecase/product_details_useCase.dart'
    as _i96;
import '../../features/home/domain/usecase/save_user_address.dart' as _i93;
import '../../features/home/domain/usecase/update_user_data_usecase.dart'
    as _i94;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i101;
import '../../features/home/domain/usecases/get_homepage_usecase.dart' as _i102;
import '../../features/home/presentation/category_screen/categry_viewmodel.dart'
    as _i116;
import '../../features/home/presentation/check_out/cubit/checkout_viewmodel_cubit.dart'
    as _i109;
import '../../features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart'
    as _i117;
import '../../features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart'
    as _i113;
import '../../features/home/presentation/occasions/occasions_viewmodel.dart'
    as _i120;
import '../../features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart'
    as _i104;
import '../../features/home/presentation/product_widget/product_view_model/product_view_model.dart'
    as _i114;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_validators.dart'
    as _i10;
import '../../features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart'
    as _i119;
import '../../features/home/presentation/profile_screen/profile_view_model/profile_view_model.dart'
    as _i110;
import '../../features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart'
    as _i115;
import '../../features/notifications/data/dataSource/notification_onlineDataSourceImpl.dart'
    as _i37;
import '../../features/notifications/data/dataSource/notification_onlineDataSourse.dart'
    as _i36;
import '../../features/notifications/data/repositoryImpl/notification_repositoryImpl.dart'
    as _i45;
import '../../features/notifications/domain/repository/notification_repository.dart'
    as _i44;
import '../../features/notifications/domain/usecases/getNotifications_usecase.dart'
    as _i85;
import '../../features/notifications/domain/usecases/removeNotification_usecase.dart'
    as _i86;
import '../../features/notifications/presentation/viewModel/notification_viewModel.dart'
    as _i103;
import '../../features/orders/data/contracts/orders_online_datasource.dart'
    as _i19;
import '../../features/orders/data/datasource/orders_online_datasource_impl.dart'
    as _i20;
import '../../features/orders/data/repos/orders_repository_impl.dart' as _i70;
import '../../features/orders/domain/repos/orders_repository.dart' as _i69;
import '../../features/orders/domain/usecases/get_orders_usecase.dart' as _i76;
import '../../features/orders/presentation/view_model/orders_view_model.dart'
    as _i90;
import '../../features/payment/data/contracts/payment_online_datasource.dart'
    as _i40;
import '../../features/payment/data/data_sources/payment_online_datasource_impl.dart'
    as _i41;
import '../../features/payment/data/repos/payment_repo_impl.dart' as _i49;
import '../../features/payment/domain/repos/payment_repo.dart' as _i48;
import '../../features/payment/domain/usecases/create_cache_order_usecase.dart'
    as _i88;
import '../../features/payment/domain/usecases/payment_usecase.dart' as _i89;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart'
    as _i30;
import '../../features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse_impl.dart'
    as _i31;
import '../../features/user_addresses/savedAddresses/data/repositoryImpl/address_repositoryImpl.dart'
    as _i57;
import '../../features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart'
    as _i56;
import '../../features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart'
    as _i74;
import '../../features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart'
    as _i75;
import '../../features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart'
    as _i95;
import '../cache/shared_preferences_service.dart' as _i58;
import '../network/api/api_manager.dart' as _i14;
import '../network/api/network_module.dart' as _i121;
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

    gh.singleton<_i14.ApiManager>(() => _i14.ApiManager(
          gh<_i11.Dio>(),
          gh<_i4.TokenProvider>(),
        ));
    gh.factory<_i15.AuthOfflineDatasource>(
        () => _i16.AuthOfflineDatasourceImpl());
    gh.factory<_i17.ProductDetails_Onlinedatasource>(
        () => _i18.ProductDetails_Onlinedatasource_Impl(gh<_i14.ApiManager>()));
    gh.factory<_i19.OrdersOnlineDatasource>(
        () => _i20.OrdersOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i21.CartOnlineDatasource>(
        () => _i22.CartOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i23.CartRepository>(
        () => _i24.CartRepositoryImpl(gh<_i21.CartOnlineDatasource>()));
    gh.factory<_i25.LogoutOnlineDatasource>(
        () => _i26.LogoutOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i27.RegisterOnlineDatasource>(
        () => _i28.RegisterOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i29.ChatRepository>(
        () => _i13.ChatRepositoryImpl(firestore: gh<_i12.FirebaseFirestore>()));
    gh.factory<_i30.AddressOnlineDatasource>(
        () => _i31.AddressOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i32.RemoteDatasource>(
        () => _i33.RemoteDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i34.GetLoggedUserDataOnlineDatasource>(() =>
        _i35.GetLoggedUserDataOnlineDataSourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i36.NotificationOnlineDataSourse>(
        () => _i37.NotificationOnlinedatasourceimpl(gh<_i14.ApiManager>()));
    gh.factory<_i38.LogoutRepo>(
        () => _i39.LogoutRpoImpl(gh<_i25.LogoutOnlineDatasource>()));
    gh.factory<_i40.PaymentOnlineDatasource>(
        () => _i41.PaymentOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i42.LoginOnlineDatasource>(
        () => _i43.LoginOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i44.NotificationRepository>(() =>
        _i45.NotificationRepositoryimpl(
            gh<_i36.NotificationOnlineDataSourse>()));
    gh.factory<_i46.UpdatePasswordOnlineDatasource>(
        () => _i47.UpdatePasswordOnlineDatasourceImpl(
              gh<_i14.ApiManager>(),
              gh<_i4.TokenProvider>(),
            ));
    gh.factory<_i48.PaymentRepo>(
        () => _i49.PaymentRepoImpl(gh<_i40.PaymentOnlineDatasource>()));
    gh.factory<_i50.ForgetPasswordOnlineDatasource>(
        () => _i51.ForgetPasswordOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i52.ForgetPasswordRepository>(() =>
        _i53.ForgetPasswordRepositoryImpl(
            gh<_i50.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i54.AuthOnlineDatasource>(
        () => _i55.AuthOnlineDatasourceImpl(gh<_i14.ApiManager>()));
    gh.factory<_i56.AddressesRepository>(
        () => _i57.AddressesRepositoryImpl(gh<_i30.AddressOnlineDatasource>()));
    gh.singleton<_i58.SharedPreferencesService>(
        () => _i58.SharedPreferencesService(gh<_i3.SharedPreferences>()));
    gh.factory<_i59.GetMessagesUseCase>(
        () => _i59.GetMessagesUseCase(repository: gh<_i29.ChatRepository>()));
    gh.factory<_i60.SendMessageUseCase>(
        () => _i60.SendMessageUseCase(repository: gh<_i29.ChatRepository>()));
    gh.factory<_i61.ProductDetailsRepository>(() => _i62.ProductDetailsRepoImpl(
        gh<_i17.ProductDetails_Onlinedatasource>()));
    gh.factory<_i63.LoginRepo>(
        () => _i64.LoginRepoImpl(gh<_i42.LoginOnlineDatasource>()));
    gh.factory<_i65.GetLoggedUserDataRepo>(() => _i66.GetLoggedUserDataRepoImpl(
        gh<_i34.GetLoggedUserDataOnlineDatasource>()));
    gh.factory<_i67.RegisterRepository>(
        () => _i68.RegisterRepositoryImpl(gh<_i27.RegisterOnlineDatasource>()));
    gh.factory<_i69.OrdersRepository>(
        () => _i70.OrdersRepositoryImpl(gh<_i19.OrdersOnlineDatasource>()));
    gh.factory<_i71.LoginUsecase>(
        () => _i71.LoginUsecase(gh<_i63.LoginRepo>()));
    gh.factory<_i72.HomeRepository>(
        () => _i73.HomeRepositoryImpl(gh<_i32.RemoteDatasource>()));
    gh.factory<_i74.GetAddressesUsecase>(
        () => _i74.GetAddressesUsecase(gh<_i56.AddressesRepository>()));
    gh.factory<_i75.RemoveAddressUsecase>(
        () => _i75.RemoveAddressUsecase(gh<_i56.AddressesRepository>()));
    gh.factory<_i76.GetOrdersUsecase>(
        () => _i76.GetOrdersUsecase(gh<_i69.OrdersRepository>()));
    gh.factory<_i77.AddProductToCartUsecase>(
        () => _i77.AddProductToCartUsecase(gh<_i23.CartRepository>()));
    gh.factory<_i78.GetCartUsecase>(
        () => _i78.GetCartUsecase(gh<_i23.CartRepository>()));
    gh.factory<_i79.RemoveItemFromCartUsecase>(
        () => _i79.RemoveItemFromCartUsecase(gh<_i23.CartRepository>()));
    gh.factory<_i80.UpdateCartProductQuantityUsecase>(
        () => _i80.UpdateCartProductQuantityUsecase(gh<_i23.CartRepository>()));
    gh.factory<_i81.CartViewmodel>(() => _i81.CartViewmodel(
          gh<_i78.GetCartUsecase>(),
          gh<_i79.RemoveItemFromCartUsecase>(),
          gh<_i80.UpdateCartProductQuantityUsecase>(),
          gh<_i77.AddProductToCartUsecase>(),
          gh<_i4.TokenProvider>(),
        ));
    gh.factory<_i82.UpdatePasswordRepository>(() =>
        _i83.UpdatePasswordRepositoryImpl(
            gh<_i46.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i84.ForgetPasswordUsecase>(
        () => _i84.ForgetPasswordUsecase(gh<_i52.ForgetPasswordRepository>()));
    gh.factory<_i85.GetNotificationsUsecase>(
        () => _i85.GetNotificationsUsecase(gh<_i44.NotificationRepository>()));
    gh.factory<_i86.RemoveNotificationUsecase>(() =>
        _i86.RemoveNotificationUsecase(gh<_i44.NotificationRepository>()));
    gh.factory<_i87.LogoutUsecase>(
        () => _i87.LogoutUsecase(gh<_i38.LogoutRepo>()));
    gh.factory<_i88.CreateCacheOrderUsecase>(
        () => _i88.CreateCacheOrderUsecase(gh<_i48.PaymentRepo>()));
    gh.factory<_i89.PaymentUsecase>(
        () => _i89.PaymentUsecase(gh<_i48.PaymentRepo>()));
    gh.factory<_i90.OrdersViewModel>(
        () => _i90.OrdersViewModel(gh<_i76.GetOrdersUsecase>()));
    gh.factory<_i91.AuthRepository>(() => _i92.AuthRepositoryImpl(
          gh<_i54.AuthOnlineDatasource>(),
          gh<_i15.AuthOfflineDatasource>(),
        ));
    gh.factory<_i93.SaveUserAddressUseCase>(
        () => _i93.SaveUserAddressUseCase(gh<_i72.HomeRepository>()));
    gh.factory<_i94.UpdateUserDataUseCase>(
        () => _i94.UpdateUserDataUseCase(gh<_i72.HomeRepository>()));
    gh.factory<_i95.AddressViewModel>(() => _i95.AddressViewModel(
          gh<_i74.GetAddressesUsecase>(),
          gh<_i75.RemoveAddressUsecase>(),
        ));
    gh.factory<_i96.ProductDetailsUsecase>(
        () => _i96.ProductDetailsUsecase(gh<_i61.ProductDetailsRepository>()));
    gh.factory<_i97.GetAllBestSellerProductsUseCase>(
        () => _i97.GetAllBestSellerProductsUseCase(gh<_i72.HomeRepository>()));
    gh.factory<_i98.GetAllProductsUseCase>(
        () => _i98.GetAllProductsUseCase(gh<_i72.HomeRepository>()));
    gh.factory<_i99.GetCategoriesUsecase>(
        () => _i99.GetCategoriesUsecase(gh<_i72.HomeRepository>()));
    gh.factory<_i100.GetOccasionsUsecase>(
        () => _i100.GetOccasionsUsecase(gh<_i72.HomeRepository>()));
    gh.factory<_i101.GetCategoriesUsecase>(
        () => _i101.GetCategoriesUsecase(gh<_i72.HomeRepository>()));
    gh.factory<_i102.GetHomepageUsecase>(
        () => _i102.GetHomepageUsecase(gh<_i72.HomeRepository>()));
    gh.factory<_i103.NotificationViewModel>(() => _i103.NotificationViewModel(
          gh<_i85.GetNotificationsUsecase>(),
          gh<_i86.RemoveNotificationUsecase>(),
        ));
    gh.factory<_i104.ProductDetails_ViewModel>(
        () => _i104.ProductDetails_ViewModel(gh<_i96.ProductDetailsUsecase>()));
    gh.factory<_i105.GetLogedUserDataUsecase>(
        () => _i105.GetLogedUserDataUsecase(gh<_i65.GetLoggedUserDataRepo>()));
    gh.factory<_i106.UpdatePasswordUseCase>(
        () => _i106.UpdatePasswordUseCase(gh<_i82.UpdatePasswordRepository>()));
    gh.factory<_i107.RegisterUseCase>(
        () => _i107.RegisterUseCase(gh<_i67.RegisterRepository>()));
    gh.factory<_i108.RegisterViewModel>(() => _i108.RegisterViewModel(
          gh<_i107.RegisterUseCase>(),
          gh<_i8.RegisterValidator>(),
        ));
    gh.factory<_i109.CheckoutViewmodelCubit>(() => _i109.CheckoutViewmodelCubit(
          gh<_i89.PaymentUsecase>(),
          gh<_i88.CreateCacheOrderUsecase>(),
        ));
    gh.factory<_i110.ProfileViewModel>(
        () => _i110.ProfileViewModel(gh<_i87.LogoutUsecase>()));
    gh.factory<_i111.ForegetPasswordViewmodel>(
        () => _i111.ForegetPasswordViewmodel(
              gh<_i84.ForgetPasswordUsecase>(),
              gh<_i6.ForgetPasswordValidator>(),
            ));
    gh.factory<_i112.LoginViewModel>(() => _i112.LoginViewModel(
          gh<_i71.LoginUsecase>(),
          gh<_i105.GetLogedUserDataUsecase>(),
        ));
    gh.factory<_i113.HomeScreenViewmodel>(
        () => _i113.HomeScreenViewmodel(gh<_i102.GetHomepageUsecase>()));
    gh.factory<_i114.ProductViewModel>(() => _i114.ProductViewModel(
          gh<_i98.GetAllProductsUseCase>(),
          gh<_i58.SharedPreferencesService>(),
          gh<_i97.GetAllBestSellerProductsUseCase>(),
        ));
    gh.factory<_i115.SaveAddressViewModel>(
        () => _i115.SaveAddressViewModel(gh<_i93.SaveUserAddressUseCase>()));
    gh.factory<_i116.CategoriesViewmodel>(
        () => _i116.CategoriesViewmodel(gh<_i99.GetCategoriesUsecase>()));
    gh.factory<_i117.CategoriesViewmodel>(
        () => _i117.CategoriesViewmodel(gh<_i101.GetCategoriesUsecase>()));
    gh.factory<_i118.UpdatePasswordViewModel>(
        () => _i118.UpdatePasswordViewModel(
              gh<_i106.UpdatePasswordUseCase>(),
              gh<_i9.UpdatePasswordValidator>(),
              gh<_i87.LogoutUsecase>(),
            ));
    gh.factory<_i119.EditProfileScreenViewModel>(() =>
        _i119.EditProfileScreenViewModel(gh<_i94.UpdateUserDataUseCase>()));
    gh.factory<_i120.OccasionsViewmodel>(
        () => _i120.OccasionsViewmodel(gh<_i100.GetOccasionsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i58.RegisterModule {}

class _$DioModule extends _i121.DioModule {}

