import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/data_sources/remote_datasource_impl.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late RemoteDatasourceImpl remoteDataSourceImpl;
  late MockApiManager mockApiManager;
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
    mockApiManager = MockApiManager();
    remoteDataSourceImpl = RemoteDatasourceImpl(mockApiManager);
    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
  });

  group("when calls getAllProducts on remoteDataSourceImpl Tests", () {
    test('getAllProducts returns Success', () async {
      when(mockApiManager.getAllProducts())
          .thenAnswer((_) async => dummyResponse);

      final actual = await remoteDataSourceImpl.getAllProducts();

      expect(actual, isA<Success<ProductResponse?>>());
      expect((actual as Success).data, dummyResponse);

      verify(mockApiManager.getAllProducts()).called(1);
    });

    test('getAllProducts returns Fail', () async {
      final exception = Exception('Failed to get details');

      when(mockApiManager.getAllProducts()).thenThrow(exception);

      final actual = await remoteDataSourceImpl.getAllProducts();

      expect(actual, isA<Fail<ProductResponse?>>());
      expect((actual as Fail).exception, exception);

      verify(mockApiManager.getAllProducts()).called(1);
    });
  });

  group("when calls getAllBestSellerProducts on remoteDataSourceImpl Tests", () {
    test('getAllBestSellerProducts returns Success', () async {
      when(mockApiManager.getAllBestSellerProducts())
          .thenAnswer((_) async => dummyBestSellerResponse);

      final actual = await remoteDataSourceImpl.getAllBestSellerProducts();

      expect(actual, isA<Success<BestSellerProductResponse?>>());
      expect((actual as Success).data, dummyBestSellerResponse);

      verify(mockApiManager.getAllBestSellerProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Fail', () async {
      final exception = Exception('Failed to get details');

      when(mockApiManager.getAllBestSellerProducts()).thenThrow(exception);

      final actual = await remoteDataSourceImpl.getAllBestSellerProducts();

      expect(actual, isA<Fail<BestSellerProductResponse?>>());
      expect((actual as Fail).exception, exception);

      verify(mockApiManager.getAllBestSellerProducts()).called(1);
    });
  });

}
