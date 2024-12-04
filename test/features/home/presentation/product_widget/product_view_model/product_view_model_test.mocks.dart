// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/home/presentation/product_widget/product_view_model/product_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i4;
import 'package:elevate_ecommerce/core/cache/shared_preferences_service.dart'
    as _i9;
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart'
    as _i11;
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart'
    as _i8;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart'
    as _i5;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart'
    as _i10;
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_best_sellet_products_usecase.dart'
    as _i7;
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart'
    as _i2;
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

/// A class which mocks [GetAllProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProductsUseCase extends _i1.Mock
    implements _i2.GetAllProductsUseCase {
  MockGetAllProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.ProductResponse?>> getAllProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.ProductResponse?>>.value(
            _i6.dummyValue<_i4.Result<_i5.ProductResponse?>>(
          this,
          Invocation.method(
            #getAllProducts,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.ProductResponse?>>);
}

/// A class which mocks [GetAllBestSellerProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllBestSellerProductsUseCase extends _i1.Mock
    implements _i7.GetAllBestSellerProductsUseCase {
  MockGetAllBestSellerProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i8.BestSellerProductResponse?>> getAllProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Result<_i8.BestSellerProductResponse?>>.value(
                _i6.dummyValue<_i4.Result<_i8.BestSellerProductResponse?>>(
          this,
          Invocation.method(
            #getAllProducts,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.BestSellerProductResponse?>>);
}

/// A class which mocks [SharedPreferencesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesService extends _i1.Mock
    implements _i9.SharedPreferencesService {
  MockSharedPreferencesService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> cacheProducts(List<_i10.Products>? products) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheProducts,
          [products],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i10.Products>?> getCachedProducts() => (super.noSuchMethod(
        Invocation.method(
          #getCachedProducts,
          [],
        ),
        returnValue: _i3.Future<List<_i10.Products>?>.value(),
      ) as _i3.Future<List<_i10.Products>?>);

  @override
  _i3.Future<void> clearCache() => (super.noSuchMethod(
        Invocation.method(
          #clearCache,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> cacheBestSellerProducts(
          List<_i11.BestSeller>? bestSellers) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheBestSellerProducts,
          [bestSellers],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i11.BestSeller>?> getCachedBestSellerProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedBestSellerProducts,
          [],
        ),
        returnValue: _i3.Future<List<_i11.BestSeller>?>.value(),
      ) as _i3.Future<List<_i11.BestSeller>?>);

  @override
  _i3.Future<void> clearBestSellerCache() => (super.noSuchMethod(
        Invocation.method(
          #clearBestSellerCache,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
