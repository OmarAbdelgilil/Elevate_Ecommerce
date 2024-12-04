import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';


import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_best_sellet_products_usecase.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../usecases/get_homepage_usecase_test.mocks.dart';




void main() {
  late GetAllBestSellerProductsUseCase getAllBestSellerProductUseCase;
  late MockHomeRepository mockHomeRepository;

  final dummyProduct = [
    BestSeller(
      id: '1',
      title: 'Test Product',
      price: 1,
    )
  ];

  final dummyResponse = BestSellerProductResponse(
    message: 'Success',
    bestSeller: dummyProduct,
  );

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getAllBestSellerProductUseCase = GetAllBestSellerProductsUseCase(mockHomeRepository);


    provideDummy<Result<BestSellerProductResponse?>>(
      Fail(Exception("Dummy value")),
    );
  });

  group('GetAllBestSellerProductsUseCase Tests', () {
    test('returns Success when repository call is successful', () async {
      final successResult = Success(dummyResponse);


      when(mockHomeRepository.getAllBestSellerProducts())
          .thenAnswer((_) async => successResult);


      final actual = await getAllBestSellerProductUseCase.getAllProducts();

      expect(actual, successResult);
      verify(mockHomeRepository.getAllBestSellerProducts()).called(1);
    });

    test('returns Fail when repository call fails', () async {
      final exception = Exception('Failed to fetch products');
      final failResult = Fail<BestSellerProductResponse?>(exception);


      when(mockHomeRepository.getAllBestSellerProducts())
          .thenAnswer((_) async => failResult);


      final actual = await getAllBestSellerProductUseCase.getAllProducts();


      expect(actual, failResult);
      verify(mockHomeRepository.getAllBestSellerProducts()).called(1);
    });
  });
}

