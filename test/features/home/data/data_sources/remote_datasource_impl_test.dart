import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';

import 'package:elevate_ecommerce/features/home/data/data_sources/remote_datasource_impl.dart';

import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart';

import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart';

import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late RemoteDatasourceImpl remoteDatasource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    remoteDatasource = RemoteDatasourceImpl(mockApiManager);
  });

  group('RemoteDatasourceImpl Tests', () {
    test('getAllCategories success on ApiManager', () async {
      final mockApiResponse = Categories();
      provideDummy<Result<Categories?>>(Success(mockApiResponse));

      when(mockApiManager.getAllCategories())
          .thenAnswer((_) async => GetAllCategoriesResponse(categories: []));

      final result = await remoteDatasource.getAllCategories();

      expect(result, isA<Success<Categories?>>());
      verify(mockApiManager.getAllCategories()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getAllCategories failure on ApiManager', () async {
      provideDummy<Result<Categories?>>(Fail(Exception()));

      when(mockApiManager.getAllCategories()).thenThrow(Exception());

      final result = await remoteDatasource.getAllCategories();

      expect(result, isA<Fail<Categories?>>());
      verify(mockApiManager.getAllCategories()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getHomePage success on ApiManager', () async {
      final mockApiResponse = Home();
      provideDummy<Result<Home?>>(Success(mockApiResponse));

      when(mockApiManager.getHomePage()).thenAnswer((_) async =>
          HomeResponse(bestSeller: [], occasions: [], products: []));

      final result = await remoteDatasource.getHomePage();

      expect(result, isA<Success<Home?>>());
      verify(mockApiManager.getHomePage()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getHomePage failure on ApiManager', () async {
      provideDummy<Result<Home?>>(Fail(Exception()));

      when(mockApiManager.getHomePage()).thenThrow(Exception());

      final result = await remoteDatasource.getHomePage();

      expect(result, isA<Fail<Home?>>());
      verify(mockApiManager.getHomePage()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
