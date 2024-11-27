import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/remote_datasource.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDatasource])
void main() {
  late HomeRepositoryImpl homeRepositoryImpl;
  late MockRemoteDatasource mockRemoteDatasourceImpl;
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
    mockRemoteDatasourceImpl = MockRemoteDatasource();
    homeRepositoryImpl = HomeRepositoryImpl(mockRemoteDatasourceImpl);
    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
  });

  group("when calls getAllProducts on homeRepositoryImpl Tests", () {
    test('getAllProducts returns Success', () async {
      final successResult = Success(dummyResponse);

      when(mockRemoteDatasourceImpl.getAllProducts())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepositoryImpl.getAllProducts();

      expect(actual, successResult);
      verify(mockRemoteDatasourceImpl.getAllProducts()).called(1);
    });

    test('getAllProducts returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<ProductResponse?>(exception);

      when(mockRemoteDatasourceImpl.getAllProducts())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepositoryImpl.getAllProducts();

      expect(actual, failResult);
      verify(mockRemoteDatasourceImpl.getAllProducts()).called(1);
    });
  });

  group("when calls getAllBestSellerProducts on homeRepositoryImpl Tests", () {
    test('getAllBestSellerProducts returns Success', () async {
      final successResult = Success(dummyBestSellerResponse);

      // Mocking getAllBestSellerProducts method
      when(mockRemoteDatasourceImpl.getAllBestSellerProducts())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepositoryImpl.getAllBestSellerProducts();

      expect(actual, successResult);
      verify(mockRemoteDatasourceImpl.getAllBestSellerProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<BestSellerProductResponse?>(exception);

      // Mocking getAllBestSellerProducts method to return a failure
      when(mockRemoteDatasourceImpl.getAllBestSellerProducts())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepositoryImpl.getAllBestSellerProducts();

      expect(actual, failResult);
      verify(mockRemoteDatasourceImpl.getAllBestSellerProducts()).called(1);
    });
  });
}
