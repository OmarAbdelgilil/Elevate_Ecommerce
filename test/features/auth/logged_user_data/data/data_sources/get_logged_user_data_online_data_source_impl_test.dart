import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/data_sources/get_logged_user_data_online_data_source_impl.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_data_online_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiManager>()])
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
