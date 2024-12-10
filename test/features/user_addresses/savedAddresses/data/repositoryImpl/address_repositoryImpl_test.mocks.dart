// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/user_addresses/savedAddresses/data/repositoryImpl/address_repositoryImpl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i4;
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart'
    as _i2;
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart'
    as _i5;
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

/// A class which mocks [AddressOnlineDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddressOnlineDatasource extends _i1.Mock
    implements _i2.AddressOnlineDatasource {
  MockAddressOnlineDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.AddressModel>>> getAddresses() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAddresses,
          [],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.AddressModel>>>.value(
            _i6.dummyValue<_i4.Result<List<_i5.AddressModel>>>(
          this,
          Invocation.method(
            #getAddresses,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.AddressModel>>>);

  @override
  _i3.Future<_i4.Result<bool?>> removeAddress(String? addressId) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeAddress,
          [addressId],
        ),
        returnValue: _i3.Future<_i4.Result<bool?>>.value(
            _i6.dummyValue<_i4.Result<bool?>>(
          this,
          Invocation.method(
            #removeAddress,
            [addressId],
          ),
        )),
      ) as _i3.Future<_i4.Result<bool?>>);
}
