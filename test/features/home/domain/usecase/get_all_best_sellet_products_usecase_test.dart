import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_best_sellet_products_usecase.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_best_sellet_products_usecase_test.mocks.dart';



@GenerateMocks([HomeRepository])
void main() {
  late GetAllBestSellerProductsUseCase getAllBestSellerProductUseCase;
  late MockHomeRepository mockHomeRepository;
  final dummyProduct = [Products(
    id: '1',
    title: 'Test Product',
    price: 1,
  )];
  final dummyResponse = ProductResponse(
    message: 'Success',
    products: dummyProduct,
  );
  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getAllBestSellerProductUseCase = GetAllBestSellerProductsUseCase(mockHomeRepository);


    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
  });

  group('when calls getAllProducts on HomeRepository Tests', () {
    test('getAllProducts returns Success ', () async {



      final successResult = Success(dummyResponse);


      when(mockHomeRepository.getAllProducts())
          .thenAnswer((_) async => successResult);


      final actual = await getAllBestSellerProductUseCase.getAllProducts();


      expect(actual, successResult);
      verify(mockHomeRepository.getAllProducts()).called(1);
    });

    test('getAllProducts returns Fail when repository fails', () async {

      final exception = Exception('Failed to get details');
      final failResult = Fail<ProductResponse?>(exception);


      when(mockHomeRepository.getAllProducts())
          .thenAnswer((_) async => failResult);

      final actual = await getAllBestSellerProductUseCase.getAllProducts();


      expect(actual, failResult);
      verify(mockHomeRepository.getAllProducts()).called(1);
    });
  });
}