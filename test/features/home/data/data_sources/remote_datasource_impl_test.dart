import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/remote_datasource.dart';
import 'package:elevate_ecommerce/features/home/data/data_sources/remote_datasource_impl.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repositories/home_repository_impl_test.mocks.dart';
import 'remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager, RemoteDatasource])
void main() {
  late RemoteDatasourceImpl remoteDatasource;
  late MockApiManager mockApiManager;
  late MockRemoteDatasource mockRemoteDatasource;

  final dummyProduct = [
    Products(
      id: '1',
      title: 'Test Product',
      price: 1,
    )
  ];

  final dummyBestProduct = [
    BestSeller(
      id: '1',
      title: 'Test Product',
      price: 1,
    )
  ];
  final dummyCategories = Categories(categories: [
    CategoryModel(
      id: '1',
      name: 'Category 1',
      slug: 'category-1',
      image: 'https://example.com/category1.png',
    ),
    CategoryModel(
      id: '2',
      name: 'Category 2',
      slug: 'category-2',
      image: 'https://example.com/category2.png',
    ),
  ]);

  final dummyOccasions = Occasions(occasions: [
    OccasionModel(
      id: '1',
      name: 'Occasion 1',
      slug: 'occasion-1',
      image: 'https://example.com/occasion1.png',
    ),
    OccasionModel(
      id: '2',
      name: 'Occasion 2',
      slug: 'occasion-2',
      image: 'https://example.com/occasion2.png',
    ),
  ]);

  final dummyResponse = ProductResponse(
    message: 'Success',
    products: dummyProduct,
  );

  final dummyBestSellerResponse = BestSellerProductResponse(
    message: 'Success',
    bestSeller: dummyBestProduct,
  );

  setUp(() {
    mockApiManager = MockApiManager();
    remoteDatasource = RemoteDatasourceImpl(mockApiManager);
    mockRemoteDatasource = MockRemoteDatasource();

    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
    provideDummy<Result<Categories?>>(Fail(Exception()));
    provideDummy<Result<Occasions?>>(Fail(Exception()));
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
    test('getAllProducts returns Success', () async {
      when(mockApiManager.getAllProducts())
          .thenAnswer((_) async => dummyResponse);

      final actual = await remoteDatasource.getAllProducts();

      expect(actual, isA<Success<ProductResponse?>>());
      expect((actual as Success).data, dummyResponse);

      verify(mockApiManager.getAllProducts()).called(1);
    });

    test('getAllProducts returns Fail', () async {
      final exception = Exception('Failed to get details');

      when(mockApiManager.getAllProducts()).thenThrow(exception);

      final actual = await remoteDatasource.getAllProducts();

      expect(actual, isA<Fail<ProductResponse?>>());
      expect((actual as Fail).exception, exception);

      verify(mockApiManager.getAllProducts()).called(1);
    });
  });

  group("when calls getAllBestSellerProducts on remoteDataSourceImpl Tests",
      () {
    test('getAllBestSellerProducts returns Success', () async {
      when(mockApiManager.getAllBestSellerProducts())
          .thenAnswer((_) async => dummyBestSellerResponse);

      final actual = await remoteDatasource.getAllBestSellerProducts();

      expect(actual, isA<Success<BestSellerProductResponse?>>());
      expect((actual as Success).data, dummyBestSellerResponse);

      verify(mockApiManager.getAllBestSellerProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Fail', () async {
      final exception = Exception('Failed to get details');

      when(mockApiManager.getAllBestSellerProducts()).thenThrow(exception);

      final actual = await remoteDatasource.getAllBestSellerProducts();

      expect(actual, isA<Fail<BestSellerProductResponse?>>());
      expect((actual as Fail).exception, exception);

      verify(mockApiManager.getAllBestSellerProducts()).called(1);
    });
  });

  group('getAllCategories Tests', () {
    test('getAllCategories returns Success', () async {
      when(mockRemoteDatasource.getAllCategories())
          .thenAnswer((_) async => Success(dummyCategories));

      final result = await mockRemoteDatasource.getAllCategories();

      expect(result, isA<Success<Categories?>>());
      expect((result as Success).data, dummyCategories);

      verify(mockRemoteDatasource.getAllCategories()).called(1);
    });

    test('getAllCategories returns Fail', () async {
      final exception = Exception('Failed to fetch categories');

      // Mock the method to throw the defined exception
      when(mockRemoteDatasource.getAllCategories())
          .thenAnswer((_) async => Fail(exception));

      final result = await mockRemoteDatasource.getAllCategories();

      // Assert that the result is of type Fail
      expect(result, isA<Fail<Categories?>>());

      // Assert that the exception matches the mocked exception
      expect((result as Fail).exception, exception);

      verify(mockRemoteDatasource.getAllCategories()).called(1);
    });
  });

  group('getAllOccasions Tests', () {
    test('getAllOccasions returns Success', () async {
      when(mockRemoteDatasource.getAllOccasions())
          .thenAnswer((_) async => Success(dummyOccasions));

      final result = await mockRemoteDatasource.getAllOccasions();

      expect(result, isA<Success<Occasions?>>());
      expect((result as Success).data, dummyOccasions);

      verify(mockRemoteDatasource.getAllOccasions()).called(1);
    });

    test('getAllOccasions returns Fail', () async {
      final exception = Exception('Failed to fetch occasions');

      when(mockRemoteDatasource.getAllOccasions())
          .thenAnswer((_) async => Fail(exception));

      final result = await mockRemoteDatasource.getAllOccasions();

      expect(result, isA<Fail<Occasions?>>());
      expect((result as Fail).exception, exception);

      verify(mockRemoteDatasource.getAllOccasions()).called(1);
    });
  });
}
