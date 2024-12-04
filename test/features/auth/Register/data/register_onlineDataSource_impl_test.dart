import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/dataSource/register_onlineDataSource_impl.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../forget_password/data/data_sources/forget_password_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  group(
      "when call RegisterDataSourceImpl.register it should call register function from ApiManager ",
      () {
    test('register success on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var registerOnlineDatasourceImpl =
          RegisterOnlineDatasourceImpl(mockApiManager);

      final request = RegisterRequest();
      final response = RegisterResponse();

      when(mockApiManager.register(any)).thenAnswer((_) async => response);

      final actual = await registerOnlineDatasourceImpl.register(request);

      expect(actual, isA<Success<RegisterResponse?>>());
      verify(mockApiManager.register(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('register faild on ApiManager', () async {
      var mockApiManager = MockApiManager();
      var registerOnlineDatasourceImpl =
          RegisterOnlineDatasourceImpl(mockApiManager);
      final request = RegisterRequest();
      when(mockApiManager.register(any)).thenThrow(Exception());

      final actual = await registerOnlineDatasourceImpl.register(request);

      expect(actual, isA<Fail<RegisterResponse?>>());
      verify(mockApiManager.register(request)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
