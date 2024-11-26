// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:elevate_ecommerce/core/network/api/api_manager.dart' as _i6;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart'
    as _i10;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart'
    as _i13;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart'
    as _i11;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart'
    as _i4;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart'
    as _i12;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart'
    as _i5;
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart'
    as _i9;
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart'
    as _i3;
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart'
    as _i8;
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart'
    as _i2;
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart'
    as _i14;
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart'
    as _i15;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart'
    as _i17;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart'
    as _i16;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeRegisterResponse_0 extends _i1.SmartFake
    implements _i2.RegisterResponse {
  _FakeRegisterResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginResponse_1 extends _i1.SmartFake implements _i3.LoginResponse {
  _FakeLoginResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgotPasswordResponse_2 extends _i1.SmartFake
    implements _i4.ForgotPasswordResponse {
  _FakeForgotPasswordResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyPasswordResponse_3 extends _i1.SmartFake
    implements _i5.VerifyPasswordResponse {
  _FakeVerifyPasswordResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i6.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.RegisterResponse> register(_i8.RegisterRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [request],
        ),
        returnValue:
            _i7.Future<_i2.RegisterResponse>.value(_FakeRegisterResponse_0(
          this,
          Invocation.method(
            #register,
            [request],
          ),
        )),
      ) as _i7.Future<_i2.RegisterResponse>);

  @override
  _i7.Future<_i3.LoginResponse> login(_i9.LoginRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue: _i7.Future<_i3.LoginResponse>.value(_FakeLoginResponse_1(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i7.Future<_i3.LoginResponse>);

  @override
  _i7.Future<_i4.ForgotPasswordResponse> forgotPassword(
          _i10.ForgotPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [request],
        ),
        returnValue: _i7.Future<_i4.ForgotPasswordResponse>.value(
            _FakeForgotPasswordResponse_2(
          this,
          Invocation.method(
            #forgotPassword,
            [request],
          ),
        )),
      ) as _i7.Future<_i4.ForgotPasswordResponse>);

  @override
  _i7.Future<_i5.VerifyPasswordResponse> verifyResetPassword(
          _i11.VerifyPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetPassword,
          [request],
        ),
        returnValue: _i7.Future<_i5.VerifyPasswordResponse>.value(
            _FakeVerifyPasswordResponse_3(
          this,
          Invocation.method(
            #verifyResetPassword,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.VerifyPasswordResponse>);

  @override
  _i7.Future<_i12.ResetPasswordResponse?> resetPassword(
          _i13.ResetPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i7.Future<_i12.ResetPasswordResponse?>.value(),
      ) as _i7.Future<_i12.ResetPasswordResponse?>);

  @override
  _i7.Future<_i14.GetAllCategoriesResponse?> getAllCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCategories,
          [],
        ),
        returnValue: _i7.Future<_i14.GetAllCategoriesResponse?>.value(),
      ) as _i7.Future<_i14.GetAllCategoriesResponse?>);

  @override
  _i7.Future<_i15.HomeResponse?> getHomePage() => (super.noSuchMethod(
        Invocation.method(
          #getHomePage,
          [],
        ),
        returnValue: _i7.Future<_i15.HomeResponse?>.value(),
      ) as _i7.Future<_i15.HomeResponse?>);

  @override
  _i7.Future<_i16.ProductResponse?> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i7.Future<_i16.ProductResponse?>.value(),
      ) as _i7.Future<_i16.ProductResponse?>);

  @override
  _i7.Future<_i17.ProductDetailsResponse?> getProductDetails(
          String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductDetails,
          [productId],
        ),
        returnValue: _i7.Future<_i17.ProductDetailsResponse?>.value(),
      ) as _i7.Future<_i17.ProductDetailsResponse?>);
}
