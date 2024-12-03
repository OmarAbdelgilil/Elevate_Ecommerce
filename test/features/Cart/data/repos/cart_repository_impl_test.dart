import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/data/contracts/cart_online_datasource.dart';
import 'package:elevate_ecommerce/features/Cart/data/repos/cart_repository_impl.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_repository_impl_test.mocks.dart';

@GenerateMocks([CartOnlineDatasource])
void main() {
  late CartRepositoryImpl cartRepository;
  late MockCartOnlineDatasource mockCartOnlineDatasource;

  setUp(() {
    mockCartOnlineDatasource = MockCartOnlineDatasource();
    cartRepository = CartRepositoryImpl(mockCartOnlineDatasource);
  });

  group('CartRepositoryImpl Tests', () {
    test('addProductToCart success on CartOnlineDatasource', () async {
      const productId = 'product123';
      const quantity = 2;
      provideDummy<Result<bool?>>(Success(true));
      final expectedResult = Success(true);

      when(mockCartOnlineDatasource.addProductToCart(productId, quantity))
          .thenAnswer((_) async => expectedResult);

      final result = await cartRepository.addProductToCart(productId, quantity);

      expect(result, expectedResult);
      verify(mockCartOnlineDatasource.addProductToCart(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('addProductToCart failure on CartOnlineDatasource', () async {
      const productId = 'product123';
      const quantity = 2;
      provideDummy<Result<bool?>>(Fail(Exception()));
      final expectedError = Fail<bool?>(Exception());

      when(mockCartOnlineDatasource.addProductToCart(productId, quantity))
          .thenAnswer((_) async => expectedError);

      final result = await cartRepository.addProductToCart(productId, quantity);

      expect(result, expectedError);
      verify(mockCartOnlineDatasource.addProductToCart(productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('getAllCart success on CartOnlineDatasource', () async {
      final mockCart = CartModel(
        cartItems: [],
        id: 'cart123',
        totalPrice: 100,
        user: 'user123',
        numOfCartItems: 2,
      );
      provideDummy<Result<CartModel?>>(Success(mockCart));
      final expectedResult = Success(mockCart);

      when(mockCartOnlineDatasource.getAllCart())
          .thenAnswer((_) async => expectedResult);

      final result = await cartRepository.getAllCart();

      expect(result, expectedResult);
      verify(mockCartOnlineDatasource.getAllCart()).called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('getAllCart failure on CartOnlineDatasource', () async {
      provideDummy<Result<CartModel?>>(Fail(Exception()));
      final expectedError = Fail<CartModel?>(Exception());

      when(mockCartOnlineDatasource.getAllCart())
          .thenAnswer((_) async => expectedError);

      final result = await cartRepository.getAllCart();

      expect(result, expectedError);
      verify(mockCartOnlineDatasource.getAllCart()).called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('removeItemFromCart success on CartOnlineDatasource', () async {
      const productId = 'product123';
      provideDummy<Result<bool?>>(Success(true));
      final expectedResult = Success(true);

      when(mockCartOnlineDatasource.removeItemFromCart(productId))
          .thenAnswer((_) async => expectedResult);

      final result = await cartRepository.removeItemFromCart(productId);

      expect(result, expectedResult);
      verify(mockCartOnlineDatasource.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('removeItemFromCart failure on CartOnlineDatasource', () async {
      const productId = 'product123';
      provideDummy<Result<bool?>>(Fail(Exception()));
      final expectedError = Fail<bool?>(Exception());

      when(mockCartOnlineDatasource.removeItemFromCart(productId))
          .thenAnswer((_) async => expectedError);

      final result = await cartRepository.removeItemFromCart(productId);

      expect(result, expectedError);
      verify(mockCartOnlineDatasource.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('updateCartProductQuantity success on CartOnlineDatasource', () async {
      const productId = 'product123';
      const quantity = 2;
      final mockCart = CartModel(
        cartItems: [],
        id: 'cart123',
        totalPrice: 100,
        user: 'user123',
        numOfCartItems: 2,
      );
      provideDummy<Result<CartModel?>>(Success(mockCart));
      final expectedResult = Success(mockCart);

      when(mockCartOnlineDatasource.updateCartProductQuantity(
              productId, quantity))
          .thenAnswer((_) async => expectedResult);

      final result =
          await cartRepository.updateCartProductQuantity(productId, quantity);

      expect(result, expectedResult);
      verify(mockCartOnlineDatasource.updateCartProductQuantity(
              productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });

    test('updateCartProductQuantity failure on CartOnlineDatasource', () async {
      const productId = 'product123';
      const quantity = 2;
      provideDummy<Result<CartModel?>>(Fail(Exception()));
      final expectedError = Fail<CartModel?>(Exception());

      when(mockCartOnlineDatasource.updateCartProductQuantity(
              productId, quantity))
          .thenAnswer((_) async => expectedError);

      final result =
          await cartRepository.updateCartProductQuantity(productId, quantity);

      expect(result, expectedError);
      verify(mockCartOnlineDatasource.updateCartProductQuantity(
              productId, quantity))
          .called(1);
      verifyNoMoreInteractions(mockCartOnlineDatasource);
    });
  });
}
