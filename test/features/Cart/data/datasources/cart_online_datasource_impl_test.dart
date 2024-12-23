import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/Cart/data/datasources/cart_online_datasource_impl.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late CartOnlineDatasourceImpl cartOnlineDatasource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    cartOnlineDatasource = CartOnlineDatasourceImpl(mockApiManager);
  });

  group('CartOnlineDatasourceImpl Tests', () {
    test('addProductToCart success on ApiManager', () async {
      const productId = "product123";
      const quantity = 2;

      when(mockApiManager.addProductToCart(argThat(
        isA<AddCartProductRequest>()
            .having((req) => req.product, 'product', productId)
            .having((req) => req.quantity, 'quantity', quantity),
      ))).thenAnswer(
        (_) async => CartResponse(cart: Cart(), message: '', numOfCartItems: 1),
      );

      final result =
          await cartOnlineDatasource.addProductToCart(productId, quantity);

      expect(result, isA<Success<bool?>>());
      verify(mockApiManager.addProductToCart(any)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('addProductToCart failure on ApiManager', () async {
      provideDummy<Result<bool?>>(Fail(Exception()));
      const productId = "product123";
      const quantity = 2;

      when(mockApiManager.addProductToCart(argThat(
        isA<AddCartProductRequest>()
            .having((req) => req.product, 'product', productId)
            .having((req) => req.quantity, 'quantity', quantity),
      ))).thenThrow(Exception());

      final result =
          await cartOnlineDatasource.addProductToCart(productId, quantity);

      expect(result, isA<Fail<bool?>>());
      verify(mockApiManager.addProductToCart(any)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getAllCart success on ApiManager', () async {
      final mockCart = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 100,
        user: "user123",
        numOfCartItems: 2,
      );

      provideDummy<Result<CartModel?>>(Success(mockCart));

      when(mockApiManager.getAllCart()).thenAnswer((_) async => CartResponse(
            cart: Cart(id: '', totalPrice: 0, cartItems: [], user: ''),
            message: '',
            numOfCartItems: 0,
          ));

      final result = await cartOnlineDatasource.getAllCart();

      expect(result, isA<Success<CartModel?>>());

      verify(mockApiManager.getAllCart()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('getAllCart failure on ApiManager', () async {
      provideDummy<Result<CartModel?>>(Fail(Exception()));

      when(mockApiManager.getAllCart()).thenThrow(Exception());

      final result = await cartOnlineDatasource.getAllCart();

      expect(result, isA<Fail<CartModel?>>());
      verify(mockApiManager.getAllCart()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('removeItemFromCart success on ApiManager', () async {
      const productId = "product123";
      provideDummy<Result<bool?>>(Success(false));

      when(mockApiManager.removeItemFromCart(productId))
          .thenAnswer((_) async => CartResponse());

      final result = await cartOnlineDatasource.removeItemFromCart(productId);

      expect(result, isA<Success<bool?>>());

      verify(mockApiManager.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('removeItemFromCart failure on ApiManager', () async {
      const productId = "product123";
      provideDummy<Result<bool?>>(Fail(Exception()));

      when(mockApiManager.removeItemFromCart(productId)).thenThrow(Exception());

      final result = await cartOnlineDatasource.removeItemFromCart(productId);

      expect(result, isA<Fail<bool?>>());
      verify(mockApiManager.removeItemFromCart(productId)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('updateCartProductQuantity success on ApiManager', () async {
      const productId = "product123";
      const quantity = 3;
      final mockCart = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 150,
        user: "user123",
        numOfCartItems: 3,
      );

      provideDummy<Result<CartModel?>>(Success(mockCart));

      when(mockApiManager.updateCartProductQuantity(
        any,
        argThat(
          isA<UpdateCartProductQuantityRequest>()
              .having((req) => req.quantity, 'quantity', quantity),
        ),
      )).thenAnswer((_) async => CartResponse(
            cart: Cart(id: '', totalPrice: 0, cartItems: [], user: ''),
            message: '',
            numOfCartItems: 0,
          ));

      final result = await cartOnlineDatasource.updateCartProductQuantity(
          productId, quantity);

      expect(result, isA<Success<CartModel?>>());
      verify(mockApiManager.updateCartProductQuantity(
        'product123',
        argThat(
          isA<UpdateCartProductQuantityRequest>()
              .having((req) => req.quantity, 'quantity', 3),
        ),
      )).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('updateCartProductQuantity failure on ApiManager', () async {
      const productId = "product123";
      const quantity = 3;
      provideDummy<Result<CartModel?>>(Fail(Exception()));

      when(mockApiManager.updateCartProductQuantity(
        any,
        argThat(
          isA<UpdateCartProductQuantityRequest>()
              .having((req) => req.quantity, 'quantity', quantity),
        ),
      )).thenThrow(Exception());

      final result = await cartOnlineDatasource.updateCartProductQuantity(
          productId, quantity);

      expect(result, isA<Fail<CartModel?>>());
      verify(mockApiManager.updateCartProductQuantity(
        'product123',
        argThat(
          isA<UpdateCartProductQuantityRequest>()
              .having((req) => req.quantity, 'quantity', 3),
        ),
      )).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
