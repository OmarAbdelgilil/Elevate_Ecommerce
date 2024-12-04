import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_item.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/get_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/remove_item_from_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_view_model_test.mocks.dart';

@GenerateMocks([
  GetCartUsecase,
  RemoveItemFromCartUsecase,
  UpdateCartProductQuantityUsecase,
  AddProductToCartUsecase,
  CartItemModel,
  CartModel,
  TokenProvider
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CartViewmodel viewmodel;
  late MockGetCartUsecase mockGetCartUsecase;
  late MockRemoveItemFromCartUsecase mockRemoveItemFromCartUsecase;
  late MockUpdateCartProductQuantityUsecase
      mockUpdateCartProductQuantityUsecase;
  late MockAddProductToCartUsecase mockAddProductToCartUsecase;
  late MockTokenProvider mockTokenProvider;
  setUp(() {
    mockGetCartUsecase = MockGetCartUsecase();
    mockRemoveItemFromCartUsecase = MockRemoveItemFromCartUsecase();
    mockUpdateCartProductQuantityUsecase =
        MockUpdateCartProductQuantityUsecase();
    mockAddProductToCartUsecase = MockAddProductToCartUsecase();
    mockTokenProvider = MockTokenProvider();

    viewmodel = CartViewmodel(
      mockGetCartUsecase,
      mockRemoveItemFromCartUsecase,
      mockUpdateCartProductQuantityUsecase,
      mockAddProductToCartUsecase,
      mockTokenProvider,
    );

    provideDummy<Result<CartModel?>>(Success<CartModel>(CartModel()));
    provideDummy<Result<bool?>>(Success<bool>(true));
  });

  group('CartViewmodel Tests', () {
    test('initial state is CartInitialState', () {
      expect(viewmodel.state, isA<CartInitialState>());
    });

    test(
        'doIntent with LoadCartIntent emits CartNotLoggedState when not logged in',
        () async {
      when(mockTokenProvider.token).thenReturn(null);

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartLoadingState>(), isA<CartNotLoggedState>()]),
      );

      viewmodel.doIntent(LoadCartIntent());
    });

    test(
        'doIntent with LoadCartIntent emits CartLoadingState, CartSuccessState on Success',
        () async {
      when(mockTokenProvider.token).thenReturn('valid_token');
      final mockCartModel = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 100,
        user: "user123",
        numOfCartItems: 3,
      );

      when(mockGetCartUsecase.getAllCart()).thenAnswer(
        (_) async => Success(mockCartModel),
      );

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartLoadingState>(), isA<CartSuccessState>()]),
      );

      viewmodel.doIntent(LoadCartIntent());
    });

    test(
        'doIntent with LoadCartIntent emits CartLoadingState, CartErrorState on Failure',
        () async {
      when(mockTokenProvider.token).thenReturn('valid_token');
      when(mockGetCartUsecase.getAllCart()).thenAnswer(
        (_) async => Fail(Exception('Failed to load cart')),
      );

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartLoadingState>(), isA<CartErrorState>()]),
      );

      viewmodel.doIntent(LoadCartIntent());
    });

    test('doIntent with RemoveItemIntent emits CartSuccessState on Success',
        () async {
      when(mockTokenProvider.token).thenReturn('valid_token');
      final mockCartModel = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 100,
        user: "user123",
        numOfCartItems: 3,
      );

      when(mockRemoveItemFromCartUsecase.removeItemFromCart(any)).thenAnswer(
        (_) async => Success(true),
      );
      when(mockGetCartUsecase.getAllCart()).thenAnswer(
        (_) async => Success(mockCartModel),
      );

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartSuccessState>()]),
      );

      viewmodel.doIntent(RemoveItemIntent('product123'));
    });

    test(
        'doIntent with AddProductIntent emits CartLoadingState, CartSuccessState and Snackbar on Success',
        () async {
      when(mockTokenProvider.token).thenReturn('valid_token');
      final mockCartModel = CartModel(
        cartItems: [],
        id: "cart123",
        totalPrice: 100,
        user: "user123",
        numOfCartItems: 3,
      );

      when(mockAddProductToCartUsecase.addProductToCart(any, any)).thenAnswer(
        (_) async => Success(true),
      );
      when(mockGetCartUsecase.getAllCart()).thenAnswer(
        (_) async => Success(mockCartModel),
      );

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartLoadingState>(), isA<CartSuccessState>()]),
      );

      viewmodel
          .doIntent(AddProductIntent(productId: 'product123', quantity: 1));
    });

    test(
        'doIntent with AddProductIntent emits CartLoadingState, CartErrorState on Failure',
        () async {
      when(mockTokenProvider.token).thenReturn('valid_token');
      when(mockAddProductToCartUsecase.addProductToCart(any, any)).thenAnswer(
        (_) async => Fail(Exception('Failed to add product')),
      );

      expectLater(
        viewmodel.stream,
        emitsInOrder([isA<CartLoadingState>(), isA<CartErrorState>()]),
      );

      viewmodel
          .doIntent(AddProductIntent(productId: 'product123', quantity: 1));
    });
  });
}
