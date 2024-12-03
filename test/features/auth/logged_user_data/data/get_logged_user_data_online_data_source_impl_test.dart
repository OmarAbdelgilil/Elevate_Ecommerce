import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/get_all_occations_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';

class DummyApiManager implements ApiManager {
  @override
  Future<UserResponse?> getProfile(String token) async {
    // Dummy success response
    if (token == 'Bearer test_token') {
      return UserResponse(message: 'Success', user: null);
    }
    // Dummy failure response
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
}

void main() {
  late GetLoggedUserDataOnlineDataSourceImpl dataSource;
  late DummyApiManager dummyApiManager;
  late TokenProvider tokenProvider;

  setUpAll(() {
    // Register TokenProvider in GetIt for testing
    getIt.registerSingleton<TokenProvider>(TokenProvider());
  });

  setUp(() {
    dummyApiManager = DummyApiManager(); // Use the dummy implementation
    tokenProvider = getIt<TokenProvider>(); // Retrieve the registered instance
    dataSource = GetLoggedUserDataOnlineDataSourceImpl(
        dummyApiManager); // Pass dummyApiManager
  });

  group('GetLoggedUserDataOnlineDataSourceImpl Tests with Dummy', () {
    test('getLoggedUserData returns UserResponse on success', () async {
      // Arrange
      final token = 'test_token';
      tokenProvider.saveToken(token); // Set a token in the provider

      // Act
      final result = await dataSource.getLoggedUserData();

      // Assert
      expect(result, isA<Success<UserResponse?>>());
      expect((result as Success).data?.message, 'Success');
    });

    test('getLoggedUserData returns Fail on ApiManager failure', () async {
      // Arrange
      final token = 'invalid_token';
      tokenProvider.saveToken(token); // Set an invalid token in the provider

      // Act
      final result = await dataSource.getLoggedUserData();

      // Assert
      expect(result, isA<Fail<UserResponse?>>());
      expect((result as Fail).exception.toString(),
          contains('Failed to fetch user data'));
    });
  });
}
