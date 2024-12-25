import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:elevate_ecommerce/features/auth/update_password/domain/useCases/update_password_usecase.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/UpdatePassword_ViewModel/updatepassword_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'updatePassword_ViewModel_test.mocks.dart';

@GenerateMocks([
  UpdatePasswordUseCase,
  LogoutUsecase,
  UpdatePasswordValidator,
  FormState,
  GlobalKey<FormState>,
  TextEditingController,
])
void main() {
  late UpdatePasswordViewModel viewmodel;
  late MockUpdatePasswordUseCase mockUpdatePasswordUseCase;
  late MockLogoutUsecase mockLogoutUsecase;
  late MockUpdatePasswordValidator mockUpdatePasswordValidator;
  late MockFormState mockFormState;
  late MockGlobalKey<FormState> mockUpdatePasswordFormKey;
  late MockTextEditingController mockCurrentPasswordController;
  late MockTextEditingController mockNewPasswordController;
  late MockTextEditingController mockConfirmPasswordController;

  setUp(() {
    mockUpdatePasswordUseCase = MockUpdatePasswordUseCase();
    mockLogoutUsecase = MockLogoutUsecase();
    mockUpdatePasswordValidator = MockUpdatePasswordValidator();
    mockFormState = MockFormState();
    mockUpdatePasswordFormKey = MockGlobalKey<FormState>();
    mockCurrentPasswordController = MockTextEditingController();
    mockNewPasswordController = MockTextEditingController();
    mockConfirmPasswordController = MockTextEditingController();

    // Set up mock behavior for validator
    when(mockUpdatePasswordValidator.updatePasswordFormKey)
        .thenReturn(mockUpdatePasswordFormKey);
    when(mockUpdatePasswordFormKey.currentState).thenReturn(mockFormState);

    when(mockUpdatePasswordValidator.currentPasswordController)
        .thenReturn(mockCurrentPasswordController);
    when(mockUpdatePasswordValidator.newPasswordController)
        .thenReturn(mockNewPasswordController);
    when(mockUpdatePasswordValidator.confirmPasswordController)
        .thenReturn(mockConfirmPasswordController);

    viewmodel = UpdatePasswordViewModel(
      mockUpdatePasswordUseCase,
      mockUpdatePasswordValidator,
      mockLogoutUsecase,
    );
  });

  group('UpdatePasswordViewModel Tests', () {
    test('Initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with UpdatePasswordIntent emits LoadingState, ErrorState on failure',
      () async {
        when(mockFormState.validate()).thenReturn(true);
        when(mockCurrentPasswordController.text).thenReturn("OldPass123!");
        when(mockNewPasswordController.text).thenReturn("NewPass456!");
        provideDummy<Result<User?>>(Fail<User?>(Exception("Error")));

        when(mockUpdatePasswordUseCase.updatePassword(any))
            .thenAnswer((_) async => Fail<User?>(Exception("Error")));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(UpdatePasswordIntent("OldPass123!", "NewPass456!"));
      },
    );

    test(
      'doIntent with invalid form emits LoadingState, ErrorState',
      () {
        when(mockFormState.validate()).thenReturn(false);

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(UpdatePasswordIntent("OldPass123!", "NewPass456!"));
      },
    );
  });
}
