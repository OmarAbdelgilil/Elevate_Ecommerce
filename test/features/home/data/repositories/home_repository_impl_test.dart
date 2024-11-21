import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/remote_datasource.dart';
import 'package:elevate_ecommerce/features/home/data/repositories/home_repository_impl.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDatasource])
void main() {
  late HomeRepositoryImpl homeRepository;
  late MockRemoteDatasource mockHomeDatasource;

  setUp(() {
    mockHomeDatasource = MockRemoteDatasource();
    homeRepository = HomeRepositoryImpl(mockHomeDatasource);
  });

  group('HomeRepositoryImpl Tests', () {
    test('getAllCategories success on RemoteDatasource', () async {
      provideDummy<Result<Categories?>>(Success(Categories()));
      final response = Categories();
      final expectedResult = Success(response);

      when(mockHomeDatasource.getAllCategories())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepository.getAllCategories();

      expect(result, expectedResult);
      verify(mockHomeDatasource.getAllCategories()).called(1);
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test('getAllCategories failure on RemoteDatasource', () async {
      provideDummy<Result<Categories?>>(Fail(Exception()));
      final expectedError = Fail<Categories>(Exception());

      when(mockHomeDatasource.getAllCategories())
          .thenAnswer((_) async => expectedError);

      final result = await homeRepository.getAllCategories();

      expect(result, expectedError);
      verify(mockHomeDatasource.getAllCategories()).called(1);
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test('getHomePage success on RemoteDatasource', () async {
      provideDummy<Result<Home?>>(Success(Home()));
      final response = Home();
      final expectedResult = Success(response);

      when(mockHomeDatasource.getHomePage())
          .thenAnswer((_) async => expectedResult);

      final result = await homeRepository.getHomePage();

      expect(result, expectedResult);
      verify(mockHomeDatasource.getHomePage()).called(1);
      verifyNoMoreInteractions(mockHomeDatasource);
    });

    test('getHomePage failure on RemoteDatasource', () async {
      provideDummy<Result<Home?>>(Fail(Exception()));
      final expectedError = Fail<Home>(Exception());

      when(mockHomeDatasource.getHomePage())
          .thenAnswer((_) async => expectedError);

      final result = await homeRepository.getHomePage();

      expect(result, expectedError);
      verify(mockHomeDatasource.getHomePage()).called(1);
      verifyNoMoreInteractions(mockHomeDatasource);
    });
  });
}
