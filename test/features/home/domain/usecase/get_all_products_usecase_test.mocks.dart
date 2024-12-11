// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/home/domain/usecase/get_all_products_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i4;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart'
    as _i12;
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart'
    as _i11;
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart'
    as _i14;
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart'
    as _i9;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart'
    as _i8;
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart'
    as _i13;
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart'
    as _i5;
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart'
    as _i7;
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart'
    as _i10;
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart'
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

/// A class which mocks [HomeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRepository extends _i1.Mock implements _i2.HomeRepository {
  MockHomeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.Categories?>> getAllCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCategories,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.Categories?>>.value(
            _i6.dummyValue<_i4.Result<_i5.Categories?>>(
          this,
          Invocation.method(
            #getAllCategories,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.Categories?>>);

  @override
  _i3.Future<_i4.Result<_i7.Home?>> getHomePage() => (super.noSuchMethod(
        Invocation.method(
          #getHomePage,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.Home?>>.value(
            _i6.dummyValue<_i4.Result<_i7.Home?>>(
          this,
          Invocation.method(
            #getHomePage,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.Home?>>);

  @override
  _i3.Future<_i4.Result<_i8.ProductResponse?>> getAllProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i8.ProductResponse?>>.value(
            _i6.dummyValue<_i4.Result<_i8.ProductResponse?>>(
          this,
          Invocation.method(
            #getAllProducts,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i8.ProductResponse?>>);

  @override
  _i3.Future<_i4.Result<_i9.BestSellerProductResponse?>>
      getAllBestSellerProducts() => (super.noSuchMethod(
            Invocation.method(
              #getAllBestSellerProducts,
              [],
            ),
            returnValue:
                _i3.Future<_i4.Result<_i9.BestSellerProductResponse?>>.value(
                    _i6.dummyValue<_i4.Result<_i9.BestSellerProductResponse?>>(
              this,
              Invocation.method(
                #getAllBestSellerProducts,
                [],
              ),
            )),
          ) as _i3.Future<_i4.Result<_i9.BestSellerProductResponse?>>);

  @override
  _i3.Future<_i4.Result<_i10.Occasions?>> getAllOccasions() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllOccasions,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<_i10.Occasions?>>.value(
            _i6.dummyValue<_i4.Result<_i10.Occasions?>>(
          this,
          Invocation.method(
            #getAllOccasions,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i10.Occasions?>>);

  @override
  _i3.Future<_i4.Result<_i11.UserResponse?>> upDateUserProfile(
          _i12.UpdateProfileRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #upDateUserProfile,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i11.UserResponse?>>.value(
            _i6.dummyValue<_i4.Result<_i11.UserResponse?>>(
          this,
          Invocation.method(
            #upDateUserProfile,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i11.UserResponse?>>);

  @override
  _i3.Future<_i4.Result<_i13.UserAddressResponse?>> saveUserAddress(
          _i14.AddressRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserAddress,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i13.UserAddressResponse?>>.value(
            _i6.dummyValue<_i4.Result<_i13.UserAddressResponse?>>(
          this,
          Invocation.method(
            #saveUserAddress,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i13.UserAddressResponse?>>);
}
