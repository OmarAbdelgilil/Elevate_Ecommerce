import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response2/cart_response2.dart';
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
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
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
  Future<CartResponse2?> addProductToCart(AddCartProductRequest req) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

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
}

void main() {
  late GetLoggedUserDataOnlineDataSourceImpl dataSource;
  late MockApiManager mockApiManager;
  late TokenProvider tokenProvider;

  // Dummy UserData for testing
  final dummyUserData = UserData(
    id: '123',
    firstName: 'Test',
    lastName: 'User',
    email: 'testuser@example.com',
    gender: 'Male',
    phone: '1234567890',
    photo: 'http://example.com/photo.jpg',
    role: 'User',
    createdAt: DateTime.parse('2022-01-01T12:00:00Z'),
    passwordChangedAt: DateTime.parse('2022-06-01T12:00:00Z'),
    addresses: [],
  );

  // Dummy response for successful profile fetch
  final dummyUserResponse = UserResponse(
    message: 'Success',
    user: dummyUserData,
  );

  setUpAll(() {
    getIt.registerSingleton<TokenProvider>(TokenProvider());
  });

  setUp(() {
    mockApiManager = MockApiManager();
    tokenProvider = getIt<TokenProvider>();
    dataSource = GetLoggedUserDataOnlineDataSourceImpl(mockApiManager);
  });

  group('GetLoggedUserDataOnlineDataSourceImpl Tests with MockApiManager', () {
    test('getLoggedUserData returns UserResponse on success', () async {
      // Correct token format (only one "Bearer")
      final token = 'test_token'; // Just the token, no "Bearer" prefix here
      tokenProvider.saveToken(token);

      // Mock the ApiManager's getProfile method
      when(mockApiManager
              .getProfile('Bearer $token')) // Correct format with "Bearer"
          .thenAnswer((_) async => dummyUserResponse);

      // Call the method
      final result = await dataSource.getLoggedUserData();

      // Assertions
      expect(result, isA<Success<UserResponse?>>());
      expect((result as Success).data?.message, 'Success');
      expect((result as Success).data?.user?.firstName, 'Test');
      expect((result as Success).data?.user?.lastName, 'User');
      verify(mockApiManager.getProfile('Bearer $token'))
          .called(1); // Correct format here
    });

    test('getLoggedUserData returns Fail on ApiManager failure', () async {
      // Correct token format
      final token = 'invalid_token'; // Test with invalid token
      tokenProvider.saveToken(token);

      // Mock the ApiManager to throw an exception
      when(mockApiManager.getProfile('Bearer $token'))
          .thenThrow(Exception('Failed to fetch user data'));

      // Call the method
      final result = await dataSource.getLoggedUserData();

      // Assertions
      expect(result, isA<Fail<UserResponse?>>());
      expect((result as Fail).exception.toString(),
          contains('Failed to fetch user data'));
      verify(mockApiManager.getProfile('Bearer $token'))
          .called(1); // Correct format here
    });
  });
}
