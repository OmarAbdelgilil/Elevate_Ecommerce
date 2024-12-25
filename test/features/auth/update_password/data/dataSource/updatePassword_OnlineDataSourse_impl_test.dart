import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/dataSource/updatepassword_online_datasourse_impl.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatepassword_request.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatepassword_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'updatePassword_OnlineDataSourse_impl_test.mocks.dart';

@GenerateMocks([ApiManager, TokenProvider])
void main() {
  group(
      "when call UpdatePasswordDataSourceImpl.updatePassword it should call updatePassword function from ApiManager ",
      () {
    test('updatePassword success on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var mockTokenProvider = MockTokenProvider();

      when(mockTokenProvider.token).thenReturn("gwdytdvwqjhkws");

      var updatePasswordOnlineDatasourceImpl =
          UpdatePasswordOnlineDatasourceImpl(
        mockApiManager,
        mockTokenProvider,
      );

      final request = UpdatePasswordRequest();
      final response = UpdatePasswordResponse();
      when(mockApiManager.updatePassword(any, any))
          .thenAnswer((_) async => response);

      final actual =
          await updatePasswordOnlineDatasourceImpl.updatePassword(request);

      expect(actual, isA<Success<User?>>());
      verify(mockApiManager.updatePassword(request, 'Bearer gwdytdvwqjhkws'))
          .called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('updatePassword failed on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var mockTokenProvider = MockTokenProvider();

      when(mockTokenProvider.token).thenReturn("gwdytdvwqjhkws");

      var updatePasswordOnlineDatasourceImpl =
          UpdatePasswordOnlineDatasourceImpl(
        mockApiManager,
        mockTokenProvider,
      );

      final request = UpdatePasswordRequest();
      when(mockApiManager.updatePassword(any, any)).thenThrow(Exception());

      final actual =
          await updatePasswordOnlineDatasourceImpl.updatePassword(request);

      expect(actual, isA<Fail<User?>>());
      verify(mockApiManager.updatePassword(request, 'Bearer gwdytdvwqjhkws'))
          .called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
