import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/dataSource/register_onlineDataSource.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/repository_impl/register_repository_impl.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_repository_impl_test.mocks.dart';
@GenerateMocks([RegisterOnlineDatasource])

void main() {
  group("when call RegisterRepo.register it should call register function from RegisterOnlineDatasource ", (){

    test('test register Success on registerOnlineDataSource ', () async {
      // Arrange
      var mockedResult = Success<User?>(User());
      provideDummy<Result<User?>>(mockedResult);
      var registerOnlineDataSource =MockRegisterOnlineDatasource();
      var registerRepoImpl =RegisterRepositoryImpl(registerOnlineDataSource);
      final request = RegisterRequest();
      when(registerOnlineDataSource.register(any)).thenAnswer((_)async=>mockedResult);
      // Act
      var actual= await registerRepoImpl.register(request);
      // Assert
      expect(actual, mockedResult);
      verify(registerOnlineDataSource.register(request)).called(1);
    });

    test('test register Fail on registerOnlineDataSource ', () async {
      // Arrange
      var failmockedResult =Fail<User?>(Exception());
      provideDummy<Result<User?>>(Fail(Exception()));
      var registerOnlineDataSource =MockRegisterOnlineDatasource();
      var registerRepoImpl =RegisterRepositoryImpl(registerOnlineDataSource);
      final request = RegisterRequest();
      when(registerOnlineDataSource.register(any)).thenAnswer((_)async=>failmockedResult);
      // Act
      var actual= await registerRepoImpl.register(request);
      // Assert
      expect(actual, failmockedResult);
      verify(registerOnlineDataSource.register(request)).called(1);
    });


  });


}