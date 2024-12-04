// Mocks generated by Mockito 5.4.4 from annotations
// in elevate_ecommerce/test/features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i13;

import 'package:elevate_ecommerce/core/common/api_result.dart' as _i6;
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart' as _i7;
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart'
    as _i11;
import 'package:elevate_ecommerce/features/auth/logout/domain/use_cases/logout_usecase.dart'
    as _i10;
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart'
    as _i8;
import 'package:elevate_ecommerce/features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i4;
import 'package:elevate_ecommerce/features/auth/update_password/presentation/Update_password_validator/update_password_types_enum.dart'
    as _i14;
import 'package:elevate_ecommerce/features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i12;
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/material.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

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

class _FakeTextEditingController_0 extends _i1.SmartFake
    implements _i2.TextEditingController {
  _FakeTextEditingController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_1<T extends _i2.State<_i2.StatefulWidget>>
    extends _i1.SmartFake implements _i2.GlobalKey<T> {
  _FakeGlobalKey_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForm_2 extends _i1.SmartFake implements _i2.Form {
  _FakeForm_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeBuildContext_3 extends _i1.SmartFake implements _i2.BuildContext {
  _FakeBuildContext_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_4 extends _i1.SmartFake implements _i2.Widget {
  _FakeWidget_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_5 extends _i1.SmartFake
    implements _i2.DiagnosticsNode {
  _FakeDiagnosticsNode_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i3.TextTreeConfiguration? parentConfiguration,
    _i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeTextSelection_6 extends _i1.SmartFake implements _i2.TextSelection {
  _FakeTextSelection_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextEditingValue_7 extends _i1.SmartFake
    implements _i2.TextEditingValue {
  _FakeTextEditingValue_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextSpan_8 extends _i1.SmartFake implements _i2.TextSpan {
  _FakeTextSpan_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [UpdatePasswordUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdatePasswordUseCase extends _i1.Mock
    implements _i4.UpdatePasswordUseCase {
  MockUpdatePasswordUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Result<_i7.User?>> updatePassword(
          _i8.UpdatePasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [request],
        ),
        returnValue: _i5.Future<_i6.Result<_i7.User?>>.value(
            _i9.dummyValue<_i6.Result<_i7.User?>>(
          this,
          Invocation.method(
            #updatePassword,
            [request],
          ),
        )),
      ) as _i5.Future<_i6.Result<_i7.User?>>);
}

/// A class which mocks [LogoutUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogoutUsecase extends _i1.Mock implements _i10.LogoutUsecase {
  MockLogoutUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Result<_i11.Logout?>> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i5.Future<_i6.Result<_i11.Logout?>>.value(
            _i9.dummyValue<_i6.Result<_i11.Logout?>>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i5.Future<_i6.Result<_i11.Logout?>>);
}

/// A class which mocks [UpdatePasswordValidator].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdatePasswordValidator extends _i1.Mock
    implements _i12.UpdatePasswordValidator {
  MockUpdatePasswordValidator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TextEditingController get currentPasswordController =>
      (super.noSuchMethod(
        Invocation.getter(#currentPasswordController),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#currentPasswordController),
        ),
      ) as _i2.TextEditingController);

  @override
  _i2.TextEditingController get newPasswordController => (super.noSuchMethod(
        Invocation.getter(#newPasswordController),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#newPasswordController),
        ),
      ) as _i2.TextEditingController);

  @override
  _i2.TextEditingController get confirmPasswordController =>
      (super.noSuchMethod(
        Invocation.getter(#confirmPasswordController),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#confirmPasswordController),
        ),
      ) as _i2.TextEditingController);

  @override
  _i2.GlobalKey<_i2.FormState> get updatePasswordFormKey => (super.noSuchMethod(
        Invocation.getter(#updatePasswordFormKey),
        returnValue: _FakeGlobalKey_1<_i2.FormState>(
          this,
          Invocation.getter(#updatePasswordFormKey),
        ),
      ) as _i2.GlobalKey<_i2.FormState>);

  @override
  void attachListeners(_i13.VoidCallback? onFieldsChanged) =>
      super.noSuchMethod(
        Invocation.method(
          #attachListeners,
          [onFieldsChanged],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void disposeFields() => super.noSuchMethod(
        Invocation.method(
          #disposeFields,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String? Function(String?) validate(_i14.UpdatePasswordValidTypes? type) =>
      (super.noSuchMethod(
        Invocation.method(
          #validate,
          [type],
        ),
        returnValue: (String? __p0) => null,
      ) as String? Function(String?));
}

/// A class which mocks [FormState].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormState extends _i1.Mock implements _i2.FormState {
  MockFormState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Form get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeForm_2(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i2.Form);

  @override
  _i2.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_3(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.BuildContext);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  _i2.Widget build(_i2.BuildContext? context) => (super.noSuchMethod(
        Invocation.method(
          #build,
          [context],
        ),
        returnValue: _FakeWidget_4(
          this,
          Invocation.method(
            #build,
            [context],
          ),
        ),
      ) as _i2.Widget);

  @override
  void save() => super.noSuchMethod(
        Invocation.method(
          #save,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reset() => super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool validate() => (super.noSuchMethod(
        Invocation.method(
          #validate,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  Set<_i2.FormFieldState<Object?>> validateGranularly() => (super.noSuchMethod(
        Invocation.method(
          #validateGranularly,
          [],
        ),
        returnValue: <_i2.FormFieldState<Object?>>{},
      ) as Set<_i2.FormFieldState<Object?>>);

  @override
  void initState() => super.noSuchMethod(
        Invocation.method(
          #initState,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateWidget(_i2.Form? oldWidget) => super.noSuchMethod(
        Invocation.method(
          #didUpdateWidget,
          [oldWidget],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reassemble() => super.noSuchMethod(
        Invocation.method(
          #reassemble,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setState(_i13.VoidCallback? fn) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [fn],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deactivate() => super.noSuchMethod(
        Invocation.method(
          #deactivate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void activate() => super.noSuchMethod(
        Invocation.method(
          #activate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didChangeDependencies() => super.noSuchMethod(
        Invocation.method(
          #didChangeDependencies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void debugFillProperties(_i3.DiagnosticPropertiesBuilder? properties) =>
      super.noSuchMethod(
        Invocation.method(
          #debugFillProperties,
          [properties],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();

  @override
  String toStringShort() => (super.noSuchMethod(
        Invocation.method(
          #toStringShort,
          [],
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
      ) as String);

  @override
  _i2.DiagnosticsNode toDiagnosticsNode({
    String? name,
    _i3.DiagnosticsTreeStyle? style,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toDiagnosticsNode,
          [],
          {
            #name: name,
            #style: style,
          },
        ),
        returnValue: _FakeDiagnosticsNode_5(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
      ) as _i2.DiagnosticsNode);
}

/// A class which mocks [GlobalKey].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalKey<T extends _i2.State<_i2.StatefulWidget>> extends _i1.Mock
    implements _i2.GlobalKey<T> {
  MockGlobalKey() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [TextEditingController].
///
/// See the documentation for Mockito's code generation for more information.
class MockTextEditingController extends _i1.Mock
    implements _i2.TextEditingController {
  MockTextEditingController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get text => (super.noSuchMethod(
        Invocation.getter(#text),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#text),
        ),
      ) as String);

  @override
  set text(String? newText) => super.noSuchMethod(
        Invocation.setter(
          #text,
          newText,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set value(_i2.TextEditingValue? newValue) => super.noSuchMethod(
        Invocation.setter(
          #value,
          newValue,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.TextSelection get selection => (super.noSuchMethod(
        Invocation.getter(#selection),
        returnValue: _FakeTextSelection_6(
          this,
          Invocation.getter(#selection),
        ),
      ) as _i2.TextSelection);

  @override
  set selection(_i2.TextSelection? newSelection) => super.noSuchMethod(
        Invocation.setter(
          #selection,
          newSelection,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.TextEditingValue get value => (super.noSuchMethod(
        Invocation.getter(#value),
        returnValue: _FakeTextEditingValue_7(
          this,
          Invocation.getter(#value),
        ),
      ) as _i2.TextEditingValue);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i2.TextSpan buildTextSpan({
    required _i2.BuildContext? context,
    _i2.TextStyle? style,
    required bool? withComposing,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildTextSpan,
          [],
          {
            #context: context,
            #style: style,
            #withComposing: withComposing,
          },
        ),
        returnValue: _FakeTextSpan_8(
          this,
          Invocation.method(
            #buildTextSpan,
            [],
            {
              #context: context,
              #style: style,
              #withComposing: withComposing,
            },
          ),
        ),
      ) as _i2.TextSpan);

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearComposing() => super.noSuchMethod(
        Invocation.method(
          #clearComposing,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}