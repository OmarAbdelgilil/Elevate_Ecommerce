import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response2/cart_response2.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/data_sources/logout_online_datasource_impl.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/get_all_occations_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:elevate_ecommerce/features/notifications/data/response/notificationResponse.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/order_response.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/models/response/addressResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_online_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiManager>()])
  @override
  Future<CartResponse?> getAllCart() {
    // TODO: implement getAllCart
    throw UnimplementedError();
  }

  @override
  Future<CartResponse2?> removeItemFromCart(String productId) {
    // TODO: implement removeItemFromCart
    throw UnimplementedError();
  }

  @override
  Future<CartResponse?> updateCartProductQuantity(
      String productId, UpdateCartProductQuantityRequest req) {
    // TODO: implement updateCartProductQuantity
    throw UnimplementedError();
  }

  @override
  Future<AddressResponse?> getAddresses() {
    // TODO: implement getAddresses
    throw UnimplementedError();
  }

  @override
  Future<AddressResponse?> removeAddress(String productId) {
    // TODO: implement removeAddress
    throw UnimplementedError();
  }

  @override
  Future<UserAddressResponse?> saveAddress(AddressRequest address) {
    // TODO: implement saveAddress
    throw UnimplementedError();
  }

  @override
  Future<OrderResponse?> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<NotificationResponse?> getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  Future<NotificationResponse?> removeNotification(String notificationId) {
    // TODO: implement removeNotification
    throw UnimplementedError();
  }


void main() {
  late LogoutOnlineDatasourceImpl dataSource;
  late MockApiManager mockApiManager;
  late TokenProvider tokenProvider;

  setUpAll(() {
    getIt.registerSingleton<TokenProvider>(TokenProvider());
  });

  setUp(() {
    mockApiManager = MockApiManager();
    tokenProvider = getIt<TokenProvider>();
    dataSource = LogoutOnlineDatasourceImpl(mockApiManager);
  });

  group('LogoutOnlineDatasourceImpl Tests', () {
    test('logout the user and remove data and token', () async {
      final token = 'test_token';
      tokenProvider.saveToken(token);

      final dummyLogoutResponse = Logout(message: 'Success');

      when(mockApiManager.logout('Bearer $token'))
          .thenAnswer((_) async => dummyLogoutResponse);

      final result = await dataSource.logout();

      expect(result, isA<Success<Logout?>>());
      expect((result as Success).data?.message, 'Success');
      verify(mockApiManager.logout('Bearer $token')).called(1);
    });

    test('logout throws exception when invalid token', () async {
      // Invalid token
      final token = 'invalid_token';
      tokenProvider.saveToken(token);

      when(mockApiManager.logout('Bearer $token'))
          .thenThrow(Exception('failed to logout'));

      final result = await dataSource.logout();

      expect(result, isA<Fail<Logout?>>());
      expect(
          (result as Fail).exception.toString(), contains('failed to logout'));
      verify(mockApiManager.logout('Bearer $token')).called(1);
    });
  });
}
