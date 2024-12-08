import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_cart_product_quantity_usecase_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late UpdateCartProductQuantityUsecase updateCartProductQuantityUsecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    updateCartProductQuantityUsecase =
        UpdateCartProductQuantityUsecase(mockCartRepository);
  });

  group('UpdateCartProductQuantityUsecase Tests', () {
    test('updateCartProductQuantity success on CartRepository', () async {
      const productId = 'product123';
      const quantity = 3;
      final mockCartModel = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 100,
        user: "user123",
        numOfCartItems: 3,
      );
      provideDummy<Result<CartModel?>>(
        Success(mockCartModel),
      );
      final expectedResult = Success(mockCartModel);

      when(mockCartRepository.updateCartProductQuantity(productId, quantity))
          .thenAnswer((_) async => expectedResult);

      final result = await updateCartProductQuantityUsecase
          .updateCartProductQuantity(productId, quantity);

      expect(result, expectedResult);
      verify(mockCartRepository.updateCartProductQuantity(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });

    test('updateCartProductQuantity failure on CartRepository', () async {
      const productId = 'product123';
      const quantity = 3;
      provideDummy<Result<CartModel?>>(
        Fail(Exception()),
      );
      final expectedError = Fail<CartModel?>(Exception());

      when(mockCartRepository.updateCartProductQuantity(productId, quantity))
          .thenAnswer((_) async => expectedError);

      final result = await updateCartProductQuantityUsecase
          .updateCartProductQuantity(productId, quantity);

      expect(result, expectedError);
      verify(mockCartRepository.updateCartProductQuantity(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
