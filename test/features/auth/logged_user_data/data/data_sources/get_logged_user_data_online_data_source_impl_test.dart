import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
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
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/order_response.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/models/response/addressResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';

class DummyApiManager implements ApiManager {
  @override
  Future<UserResponse?> getProfile(String token) async {
    if (token == 'Bearer test_token') {
      return UserResponse(message: 'Success', user: null);
    }
    throw Exception('Failed to fetch user data');
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<BestSellerProductResponse?> getAllBestSellerProducts() {
    throw UnimplementedError();
  }

  @override
  Future<GetAllCategoriesResponse?> getAllCategories() {
    throw UnimplementedError();
  }

  @override
  Future<GetAllOccasionsResponse?> getAllOccasions() {
    throw UnimplementedError();
  }

  @override
  Future<ProductResponse?> getAllProducts() {
    throw UnimplementedError();
  }

  @override
  Future<HomeResponse?> getHomePage() {
    throw UnimplementedError();
  }

  @override
  Future<ProductDetailsResponse?> getProductDetails(String productId) {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(LoginRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<ResetPasswordResponse?> resetPassword(ResetPasswordRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<VerifyPasswordResponse> verifyResetPassword(
      VerifyPasswordRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<Logout?> logout(String authorization) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserResponse?> updateProfileData(UpdateProfileRequest request) {
    // TODO: implement updateProfileData
    throw UnimplementedError();
  }

  @override
  Future<UpdatePasswordResponse> updatePassword(
      UpdatePasswordRequest request, String authorization) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<CartResponse?> addProductToCart(AddCartProductRequest req) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  Future<CartResponse?> getAllCart() {
    // TODO: implement getAllCart
    throw UnimplementedError();
  }

  @override
  Future<CartResponse?> removeItemFromCart(String productId) {
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
}

void main() {
  late GetLoggedUserDataOnlineDataSourceImpl dataSource;
  late DummyApiManager dummyApiManager;
  late TokenProvider tokenProvider;

  setUpAll(() {
    getIt.registerSingleton<TokenProvider>(TokenProvider());
  });

  setUp(() {
    dummyApiManager = DummyApiManager();
    tokenProvider = getIt<TokenProvider>();
    dataSource = GetLoggedUserDataOnlineDataSourceImpl(dummyApiManager);
  });

  group('GetLoggedUserDataOnlineDataSourceImpl Tests with Dummy', () {
    test('getLoggedUserData returns UserResponse on success', () async {
      final token = 'test_token';
      tokenProvider.saveToken(token);

      final result = await dataSource.getLoggedUserData();

      // Assert
      expect(result, isA<Success<UserResponse?>>());
      expect((result as Success).data?.message, 'Success');
    });

    test('getLoggedUserData returns Fail on ApiManager failure', () async {
      final token = 'invalid_token';
      tokenProvider.saveToken(token);
      final result = await dataSource.getLoggedUserData();
      expect(result, isA<Fail<UserResponse?>>());
      expect((result as Fail).exception.toString(),
          contains('Failed to fetch user data'));
    });
  });
}
