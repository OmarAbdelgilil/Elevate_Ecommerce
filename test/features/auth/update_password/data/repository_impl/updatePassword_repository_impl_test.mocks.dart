// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/auth/update_password/data/repository_impl/updatePassword_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i4;
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart' as _i5;
import 'package:elevate_ecommerce/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i2;
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

/// A class which mocks [UpdatePasswordOnlineDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdatePasswordOnlineDatasource extends _i1.Mock
    implements _i2.UpdatePasswordOnlineDatasource {
  MockUpdatePasswordOnlineDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<_i5.User?>> updatePassword(
          _i6.UpdatePasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [request],
        ),
        returnValue: _i3.Future<_i4.Result<_i5.User?>>.value(
            _i7.dummyValue<_i4.Result<_i5.User?>>(
          this,
          Invocation.method(
            #updatePassword,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i5.User?>>);
}