import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'updatePassword_OnlineDataSourse_impl_test.mocks.dart';


@GenerateMocks([ApiManager])
void main() {
  group(
      "when call RegisterDataSourceImpl.register it should call register function from ApiManager ", () {
    test('register success on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var updatePasswordOnlineDatasourceImpl = UpdatePasswordOnlineDatasourceImpl(
          mockApiManager);

      final request = UpdatePasswordRequest();
      final response = UpdatePasswordResponse();

      when(mockApiManager.updatePassword(any)).thenAnswer((
          _) async => response);

      final actual = await updatePasswordOnlineDatasourceImpl.updatePassword(
          request);


      expect(actual, isA<Success<User?>>());
      verify(mockApiManager.updatePassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('register faild on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var updatePasswordOnlineDatasourceImpl = UpdatePasswordOnlineDatasourceImpl(
          mockApiManager);
      final request = UpdatePasswordRequest();
      when(mockApiManager.updatePassword(any)).thenThrow(Exception());

      final actual = await updatePasswordOnlineDatasourceImpl.updatePassword(
          request);

      expect(actual, isA<Fail<User?>>());
      verify(mockApiManager.updatePassword(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}