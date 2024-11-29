import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/remote_datasource.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/occasion.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/data/repositories/home_repository_impl.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../data_sources/remote_datasource_impl_test.mocks.dart';
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
  final dummyCategories = Categories(categories: [
    CategoryModel(
        id: '1', name: 'Category 1', slug: 'cat-1', image: 'image1.png'),
    CategoryModel(
        id: '2', name: 'Category 2', slug: 'cat-2', image: 'image2.png'),
  ]);
  final dummyOccasions = Occasions(occasions: [
    OccasionModel(id: '1', name: 'Occasion 1'),
    OccasionModel(id: '2', name: 'Occasion 2'),
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
    mockRemoteDatasourceImpl = MockRemoteDatasource();
    homeRepositoryImpl = HomeRepositoryImpl(mockRemoteDatasourceImpl);
    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));
    provideDummy<Result<Categories?>>(Fail(Exception()));
    provideDummy<Result<Occasions?>>(Fail(Exception()));
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

      when(mockRemoteDatasourceImpl.getAllBestSellerProducts())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepositoryImpl.getAllBestSellerProducts();

      expect(actual, successResult);
      verify(mockRemoteDatasourceImpl.getAllBestSellerProducts()).called(1);
    });

    test('getAllBestSellerProducts returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<BestSellerProductResponse?>(exception);

      when(mockRemoteDatasourceImpl.getAllBestSellerProducts())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepositoryImpl.getAllBestSellerProducts();

      expect(actual, failResult);
      verify(mockRemoteDatasourceImpl.getAllBestSellerProducts()).called(1);
    });
  });

  group("when calls getAllCategories on homeRepositoryImpl Tests", () {
    test('getAllCategories returns Success', () async {
      final successResult = Success(dummyCategories);

      when(mockRemoteDatasourceImpl.getAllCategories())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepositoryImpl.getAllCategories();

      expect(actual, successResult);
      verify(mockRemoteDatasourceImpl.getAllCategories()).called(1);
    });

    test('getAllCategories returns Fail', () async {
      final exception = Exception('Failed to fetch categories');
      final failResult = Fail<Categories?>(exception);

      when(mockRemoteDatasourceImpl.getAllCategories())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepositoryImpl.getAllCategories();

      expect(actual, failResult);
      verify(mockRemoteDatasourceImpl.getAllCategories()).called(1);
    });
  });

  group("when calls getAllOccasions on homeRepositoryImpl Tests", () {
    test('getAllOccasions returns Success', () async {
      final successResult = Success(dummyOccasions);

      when(mockRemoteDatasourceImpl.getAllOccasions())
          .thenAnswer((_) async => successResult);

      final actual = await homeRepositoryImpl.getAllOccasions();

      expect(actual, successResult);
      verify(mockRemoteDatasourceImpl.getAllOccasions()).called(1);
    });

    test('getAllOccasions returns Fail', () async {
      final exception = Exception('Failed to fetch occasions');
      final failResult = Fail<Occasions?>(exception);

      when(mockRemoteDatasourceImpl.getAllOccasions())
          .thenAnswer((_) async => failResult);

      final actual = await homeRepositoryImpl.getAllOccasions();

      expect(actual, failResult);
      verify(mockRemoteDatasourceImpl.getAllOccasions()).called(1);
    });
  });
}
