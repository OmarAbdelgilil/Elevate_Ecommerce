import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/remove_item_from_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_item_from_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late RemoveItemFromCartUsecase removeItemFromCartUsecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    removeItemFromCartUsecase = RemoveItemFromCartUsecase(mockCartRepository);
  });

  group('RemoveItemFromCartUsecase Tests', () {
    test('removeItemFromCart success on CartRepository', () async {
      const productId = 'product123';
      provideDummy<Result<bool?>>(
        Success(true),
      );
      final expectedResult = Success(true);

      when(mockCartRepository.removeItemFromCart(productId))
          .thenAnswer((_) async => expectedResult);

      final result =
          await removeItemFromCartUsecase.removeItemFromCart(productId);

      expect(result, expectedResult);
      verify(mockCartRepository.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });

    test('removeItemFromCart failure on CartRepository', () async {
      const productId = 'product123';
      provideDummy<Result<bool?>>(
        Fail(Exception()),
      );
      final expectedError = Fail<bool?>(Exception());

      when(mockCartRepository.removeItemFromCart(productId))
          .thenAnswer((_) async => expectedError);

      final result =
          await removeItemFromCartUsecase.removeItemFromCart(productId);

      expect(result, expectedError);
      verify(mockCartRepository.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockCartRepository);
    });
  });
}
