import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/remote_datasource.dart';
import 'package:elevate_ecommerce/features/home/data/repositories/home_repository_impl.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDatasource])
void main() {
  late HomeRepositoryImpl homeRepository;
  late MockRemoteDatasource mockHomeDatasource;
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
  final dummyResponse = ProductResponse(
    message: 'Success',
    products: dummyProduct,
  );
  final dummyBestSellerResponse = BestSellerProductResponse(
    message: 'Success',
    bestSeller: dummyBestProduct,
  );

  setUp(() {
    mockHomeDatasource = MockRemoteDatasource();
    homeRepository = HomeRepositoryImpl(mockHomeDatasource);
    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
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
    test('getAllProducts returns Success', () async {
      final successResult = Success(dummyResponse);

      when(mockHomeDatasource.getAllProducts())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepository.getAllProducts();

      expect(actual, successResult);
      verify(mockHomeDatasource.getAllProducts()).called(1);
    });

    test('getAllProducts returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<ProductResponse?>(exception);

      when(mockHomeDatasource.getAllProducts())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepository.getAllProducts();

      expect(actual, failResult);
      verify(mockHomeDatasource.getAllProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Success', () async {
      final successResult = Success(dummyBestSellerResponse);

      // Mocking getAllBestSellerProducts method
      when(mockHomeDatasource.getAllBestSellerProducts())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepository.getAllBestSellerProducts();

      expect(actual, successResult);
      verify(mockHomeDatasource.getAllBestSellerProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<BestSellerProductResponse?>(exception);

      // Mocking getAllBestSellerProducts method to return a failure
      when(mockHomeDatasource.getAllBestSellerProducts())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepository.getAllBestSellerProducts();

      expect(actual, failResult);
      verify(mockHomeDatasource.getAllBestSellerProducts()).called(1);
    });
  });
}
