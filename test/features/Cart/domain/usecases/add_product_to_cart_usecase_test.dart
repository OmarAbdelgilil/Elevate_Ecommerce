import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_product_to_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late AddProductToCartUsecase addProductToCartUsecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    addProductToCartUsecase = AddProductToCartUsecase(mockCartRepository);
  });

  group('AddProductToCartUsecase Tests', () {
    test('addProductToCart success on CartRepository', () async {
      const productId = 'product123';
      const quantity = 2;
      provideDummy<Result<bool?>>(Success(true));
      final expectedResult = Success(true);

      when(mockCartRepository.addProductToCart(productId, quantity))
          .thenAnswer((_) async => expectedResult);

      final result =
          await addProductToCartUsecase.addProductToCart(productId, quantity);

      expect(result, expectedResult);
      verify(mockCartRepository.addProductToCart(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });

    test('addProductToCart failure on CartRepository', () async {
      const productId = 'product123';
      const quantity = 2;
      provideDummy<Result<bool?>>(Fail(Exception()));
      final expectedError = Fail<bool?>(Exception());

      when(mockCartRepository.addProductToCart(productId, quantity))
          .thenAnswer((_) async => expectedError);

      final result =
          await addProductToCartUsecase.addProductToCart(productId, quantity);

      expect(result, expectedError);
      verify(mockCartRepository.addProductToCart(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
