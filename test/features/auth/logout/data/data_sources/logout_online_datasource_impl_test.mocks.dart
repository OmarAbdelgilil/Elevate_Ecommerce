// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/auth/logout/data/data_sources/logout_online_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:elevate_ecommerce/core/network/api/api_manager.dart' as _i7;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart'
    as _i12;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart'
    as _i15;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart'
    as _i26;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart'
    as _i13;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart'
    as _i5;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart'
    as _i14;
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart'
    as _i6;
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart'
    as _i25;
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart'
    as _i11;
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart'
    as _i4;
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart'
    as _i27;
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart'
    as _i9;
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart'
    as _i2;
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart'
    as _i10;
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_response.dart'
    as _i3;
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart'
    as _i23;
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart'
    as _i24;
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart'
    as _i22;
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart'
    as _i29;
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart'
    as _i19;
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart'
    as _i16;
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/get_all_occations_response.dart'
    as _i21;
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart'
    as _i17;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart'
    as _i20;
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart'
    as _i18;
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart'
    as _i28;
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/order_response.dart'
    as _i31;
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart'
    as _i32;
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart'
    as _i33;
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/models/response/addressResponse.dart'
    as _i30;
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

class _FakeUpdatePasswordResponse_1 extends _i1.SmartFake
    implements _i3.UpdatePasswordResponse {
  _FakeUpdatePasswordResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginResponse_2 extends _i1.SmartFake implements _i4.LoginResponse {
  _FakeLoginResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgotPasswordResponse_3 extends _i1.SmartFake
    implements _i5.ForgotPasswordResponse {
  _FakeForgotPasswordResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyPasswordResponse_4 extends _i1.SmartFake
    implements _i6.VerifyPasswordResponse {
  _FakeVerifyPasswordResponse_4(
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
class MockApiManager extends _i1.Mock implements _i7.ApiManager {
  @override
  _i8.Future<_i2.RegisterResponse> register(_i9.RegisterRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [request],
        ),
        returnValue:
            _i8.Future<_i2.RegisterResponse>.value(_FakeRegisterResponse_0(
          this,
          Invocation.method(
            #register,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.RegisterResponse>.value(_FakeRegisterResponse_0(
          this,
          Invocation.method(
            #register,
            [request],
          ),
        )),
      ) as _i8.Future<_i2.RegisterResponse>);

  @override
  _i8.Future<_i3.UpdatePasswordResponse> updatePassword(
    _i10.UpdatePasswordRequest? request,
    String? authorization,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [
            request,
            authorization,
          ],
        ),
        returnValue: _i8.Future<_i3.UpdatePasswordResponse>.value(
            _FakeUpdatePasswordResponse_1(
          this,
          Invocation.method(
            #updatePassword,
            [
              request,
              authorization,
            ],
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i3.UpdatePasswordResponse>.value(
            _FakeUpdatePasswordResponse_1(
          this,
          Invocation.method(
            #updatePassword,
            [
              request,
              authorization,
            ],
          ),
        )),
      ) as _i8.Future<_i3.UpdatePasswordResponse>);

  @override
  _i8.Future<_i4.LoginResponse> login(_i11.LoginRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue: _i8.Future<_i4.LoginResponse>.value(_FakeLoginResponse_2(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i4.LoginResponse>.value(_FakeLoginResponse_2(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i8.Future<_i4.LoginResponse>);

  @override
  _i8.Future<_i5.ForgotPasswordResponse> forgotPassword(
          _i12.ForgotPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [request],
        ),
        returnValue: _i8.Future<_i5.ForgotPasswordResponse>.value(
            _FakeForgotPasswordResponse_3(
          this,
          Invocation.method(
            #forgotPassword,
            [request],
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i5.ForgotPasswordResponse>.value(
            _FakeForgotPasswordResponse_3(
          this,
          Invocation.method(
            #forgotPassword,
            [request],
          ),
        )),
      ) as _i8.Future<_i5.ForgotPasswordResponse>);

  @override
  _i8.Future<_i6.VerifyPasswordResponse> verifyResetPassword(
          _i13.VerifyPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetPassword,
          [request],
        ),
        returnValue: _i8.Future<_i6.VerifyPasswordResponse>.value(
            _FakeVerifyPasswordResponse_4(
          this,
          Invocation.method(
            #verifyResetPassword,
            [request],
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i6.VerifyPasswordResponse>.value(
            _FakeVerifyPasswordResponse_4(
          this,
          Invocation.method(
            #verifyResetPassword,
            [request],
          ),
        )),
      ) as _i8.Future<_i6.VerifyPasswordResponse>);

  @override
  _i8.Future<_i14.ResetPasswordResponse?> resetPassword(
          _i15.ResetPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i8.Future<_i14.ResetPasswordResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i14.ResetPasswordResponse?>.value(),
      ) as _i8.Future<_i14.ResetPasswordResponse?>);

  @override
  _i8.Future<_i16.GetAllCategoriesResponse?> getAllCategories() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCategories,
          [],
        ),
        returnValue: _i8.Future<_i16.GetAllCategoriesResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i16.GetAllCategoriesResponse?>.value(),
      ) as _i8.Future<_i16.GetAllCategoriesResponse?>);

  @override
  _i8.Future<_i17.HomeResponse?> getHomePage() => (super.noSuchMethod(
        Invocation.method(
          #getHomePage,
          [],
        ),
        returnValue: _i8.Future<_i17.HomeResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i17.HomeResponse?>.value(),
      ) as _i8.Future<_i17.HomeResponse?>);

  @override
  _i8.Future<_i18.ProductResponse?> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i8.Future<_i18.ProductResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i18.ProductResponse?>.value(),
      ) as _i8.Future<_i18.ProductResponse?>);

  @override
  _i8.Future<_i19.BestSellerProductResponse?> getAllBestSellerProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBestSellerProducts,
          [],
        ),
        returnValue: _i8.Future<_i19.BestSellerProductResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i19.BestSellerProductResponse?>.value(),
      ) as _i8.Future<_i19.BestSellerProductResponse?>);

  @override
  _i8.Future<_i20.ProductDetailsResponse?> getProductDetails(
          String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductDetails,
          [productId],
        ),
        returnValue: _i8.Future<_i20.ProductDetailsResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i20.ProductDetailsResponse?>.value(),
      ) as _i8.Future<_i20.ProductDetailsResponse?>);

  @override
  _i8.Future<_i21.GetAllOccasionsResponse?> getAllOccasions() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllOccasions,
          [],
        ),
        returnValue: _i8.Future<_i21.GetAllOccasionsResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i21.GetAllOccasionsResponse?>.value(),
      ) as _i8.Future<_i21.GetAllOccasionsResponse?>);

  @override
  _i8.Future<_i22.CartResponse?> getAllCart() => (super.noSuchMethod(
        Invocation.method(
          #getAllCart,
          [],
        ),
        returnValue: _i8.Future<_i22.CartResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i22.CartResponse?>.value(),
      ) as _i8.Future<_i22.CartResponse?>);

  @override
  _i8.Future<_i22.CartResponse?> addProductToCart(
          _i23.AddCartProductRequest? req) =>
      (super.noSuchMethod(
        Invocation.method(
          #addProductToCart,
          [req],
        ),
        returnValue: _i8.Future<_i22.CartResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i22.CartResponse?>.value(),
      ) as _i8.Future<_i22.CartResponse?>);

  @override
  _i8.Future<_i22.CartResponse?> updateCartProductQuantity(
    String? productId,
    _i24.UpdateCartProductQuantityRequest? req,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCartProductQuantity,
          [
            productId,
            req,
          ],
        ),
        returnValue: _i8.Future<_i22.CartResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i22.CartResponse?>.value(),
      ) as _i8.Future<_i22.CartResponse?>);

  @override
  _i8.Future<_i22.CartResponse?> removeItemFromCart(String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeItemFromCart,
          [productId],
        ),
        returnValue: _i8.Future<_i22.CartResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i22.CartResponse?>.value(),
      ) as _i8.Future<_i22.CartResponse?>);

  @override
  _i8.Future<_i25.UserResponse?> getProfile(String? authorization) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfile,
          [authorization],
        ),
        returnValue: _i8.Future<_i25.UserResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i25.UserResponse?>.value(),
      ) as _i8.Future<_i25.UserResponse?>);

  @override
  _i8.Future<_i25.UserResponse?> updateProfileData(
          _i26.UpdateProfileRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfileData,
          [request],
        ),
        returnValue: _i8.Future<_i25.UserResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i25.UserResponse?>.value(),
      ) as _i8.Future<_i25.UserResponse?>);

  @override
  _i8.Future<_i27.Logout?> logout(String? authorization) => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [authorization],
        ),
        returnValue: _i8.Future<_i27.Logout?>.value(),
        returnValueForMissingStub: _i8.Future<_i27.Logout?>.value(),
      ) as _i8.Future<_i27.Logout?>);

  @override
  _i8.Future<_i28.UserAddressResponse?> saveAddress(
          _i29.AddressRequest? address) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveAddress,
          [address],
        ),
        returnValue: _i8.Future<_i28.UserAddressResponse?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i28.UserAddressResponse?>.value(),
      ) as _i8.Future<_i28.UserAddressResponse?>);

  @override
  _i8.Future<_i30.AddressResponse?> getAddresses() => (super.noSuchMethod(
        Invocation.method(
          #getAddresses,
          [],
        ),
        returnValue: _i8.Future<_i30.AddressResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i30.AddressResponse?>.value(),
      ) as _i8.Future<_i30.AddressResponse?>);

  @override
  _i8.Future<_i30.AddressResponse?> removeAddress(String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeAddress,
          [productId],
        ),
        returnValue: _i8.Future<_i30.AddressResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i30.AddressResponse?>.value(),
      ) as _i8.Future<_i30.AddressResponse?>);

  @override
  _i8.Future<_i31.OrderResponse?> getOrders() => (super.noSuchMethod(
        Invocation.method(
          #getOrders,
          [],
        ),
        returnValue: _i8.Future<_i31.OrderResponse?>.value(),
        returnValueForMissingStub: _i8.Future<_i31.OrderResponse?>.value(),
      ) as _i8.Future<_i31.OrderResponse?>);

  @override
  _i8.Future<_i32.Payment?> doPayment(_i33.PaymentRequest? paymentRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #doPayment,
          [paymentRequest],
        ),
        returnValue: _i8.Future<_i32.Payment?>.value(),
        returnValueForMissingStub: _i8.Future<_i32.Payment?>.value(),
      ) as _i8.Future<_i32.Payment?>);
}
