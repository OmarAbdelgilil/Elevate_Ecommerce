import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/product_details_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/product_details_useCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_useCase_test.mocks.dart';

@GenerateMocks([ProductDetailsRepository])
void main() {
  late ProductDetailsUsecase productDetailsUsecase;
  late MockProductDetailsRepository mockProductDetailsRepository;
  final dummyProduct = Products(
    id: '1',
    title: 'Test Product',
    price: 100,
  );
  final dummyResponse = ProductDetailsResponse(
    message: 'Success',
    product: dummyProduct,
  );
  setUp(() {
    mockProductDetailsRepository = MockProductDetailsRepository();
    productDetailsUsecase = ProductDetailsUsecase(mockProductDetailsRepository);


    provideDummy<Result<ProductDetailsResponse?>>(Fail(Exception()));
  });

  group('when calls getProductDetails on ProductDetailsRepository Tests', () {
    test('getProductDetails returns Success ', () async {



      final successResult = Success(dummyResponse);


      when(mockProductDetailsRepository.getProductDetails(any))
          .thenAnswer((_) async => successResult);


      final actual = await productDetailsUsecase.getProductDetails('productId');


      expect(actual, successResult);
      verify(mockProductDetailsRepository.getProductDetails('productId')).called(1);
    });

    test('getProductDetails returns Fail when repository fails', () async {

      final exception = Exception('Failed to get details');
      final failResult = Fail<ProductDetailsResponse?>(exception);


      when(mockProductDetailsRepository.getProductDetails(any))
          .thenAnswer((_) async => failResult);

      final actual = await productDetailsUsecase.getProductDetails('productId');


      expect(actual, failResult);
      verify(mockProductDetailsRepository.getProductDetails('productId')).called(1);
    });
  });
}