import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/get_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late GetCartUsecase getCartUsecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    getCartUsecase = GetCartUsecase(mockCartRepository);
  });

  group('GetCartUsecase Tests', () {
    test('getAllCart success on CartRepository', () async {
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

      when(mockCartRepository.getAllCart()).thenAnswer(
        (_) async => expectedResult,
      );

      final result = await getCartUsecase.getAllCart();

      expect(result, expectedResult);
      verify(mockCartRepository.getAllCart()).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });

    test('getAllCart failure on CartRepository', () async {
      provideDummy<Result<CartModel?>>(
        Fail(Exception()),
      );
      final expectedError = Fail<CartModel?>(Exception());

      when(mockCartRepository.getAllCart()).thenAnswer(
        (_) async => expectedError,
      );

      final result = await getCartUsecase.getAllCart();

      expect(result, expectedError);
      verify(mockCartRepository.getAllCart()).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
