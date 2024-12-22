import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/data_sources/logout_online_datasource_impl.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_online_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiManager>()])
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
