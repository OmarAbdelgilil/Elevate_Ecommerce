// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/Cart/presentation/viewmodel/cart_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i4;
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_item.dart'
    as _i10;
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart'
    as _i5;
import 'package:elevate_ecommerce/features/Cart/domain/usecases/add_product_to_cart_usecase.dart'
    as _i9;
import 'package:elevate_ecommerce/features/Cart/domain/usecases/get_cart_usecase.dart'
    as _i2;
import 'package:elevate_ecommerce/features/Cart/domain/usecases/remove_item_from_cart_usecase.dart'
    as _i7;
import 'package:elevate_ecommerce/features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart'
    as _i8;
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart'
    as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetCartUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCartUsecase extends _i1.Mock implements _i2.GetCartUsecase {
  MockGetCartUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.CartModel?>> getAllCart() => (super.noSuchMethod(
        Invocation.method(
          #getAllCart,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.CartModel?>>.value(
            _i6.dummyValue<_i4.Result<_i5.CartModel?>>(
          this,
          Invocation.method(
            #getAllCart,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.CartModel?>>);
}

/// A class which mocks [RemoveItemFromCartUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveItemFromCartUsecase extends _i1.Mock
    implements _i7.RemoveItemFromCartUsecase {
  MockRemoveItemFromCartUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<bool?>> removeItemFromCart(String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeItemFromCart,
          [productId],
        ),
        returnValue: _i3.Future<_i4.Result<bool?>>.value(
            _i6.dummyValue<_i4.Result<bool?>>(
          this,
          Invocation.method(
            #removeItemFromCart,
            [productId],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool?>>);
}

/// A class which mocks [UpdateCartProductQuantityUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateCartProductQuantityUsecase extends _i1.Mock
    implements _i8.UpdateCartProductQuantityUsecase {
  MockUpdateCartProductQuantityUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.CartModel?>> updateCartProductQuantity(
    String? productId,
    int? quantity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCartProductQuantity,
          [
            productId,
            quantity,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.CartModel?>>.value(
            _i6.dummyValue<_i4.Result<_i5.CartModel?>>(
          this,
          Invocation.method(
            #updateCartProductQuantity,
            [
              productId,
              quantity,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.CartModel?>>);
}

/// A class which mocks [AddProductToCartUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddProductToCartUsecase extends _i1.Mock
    implements _i9.AddProductToCartUsecase {
  MockAddProductToCartUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<bool?>> addProductToCart(
    String? productId,
    int? quantity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addProductToCart,
          [
            productId,
            quantity,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<bool?>>.value(
            _i6.dummyValue<_i4.Result<bool?>>(
          this,
          Invocation.method(
            #addProductToCart,
            [
              productId,
              quantity,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool?>>);
}

/// A class which mocks [CartItemModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartItemModel extends _i1.Mock implements _i10.CartItemModel {
  MockCartItemModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set product(_i11.ProductModel? _product) => super.noSuchMethod(
        Invocation.setter(
          #product,
          _product,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set price(int? _price) => super.noSuchMethod(
        Invocation.setter(
          #price,
          _price,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set quantity(int? _quantity) => super.noSuchMethod(
        Invocation.setter(
          #quantity,
          _quantity,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [CartModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartModel extends _i1.Mock implements _i5.CartModel {
  MockCartModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set numOfCartItems(int? _numOfCartItems) => super.noSuchMethod(
        Invocation.setter(
          #numOfCartItems,
          _numOfCartItems,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set user(String? _user) => super.noSuchMethod(
        Invocation.setter(
          #user,
          _user,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set cartItems(List<_i10.CartItemModel>? _cartItems) => super.noSuchMethod(
        Invocation.setter(
          #cartItems,
          _cartItems,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set totalPrice(int? _totalPrice) => super.noSuchMethod(
        Invocation.setter(
          #totalPrice,
          _totalPrice,
        ),
        returnValueForMissingStub: null,
      );
}
