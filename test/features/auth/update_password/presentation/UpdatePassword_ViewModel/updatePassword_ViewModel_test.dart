import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/domain/useCases/update_password_useCase.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'updatePassword_ViewModel_test.mocks.dart';


@GenerateMocks([
  UpdatePasswordUseCase,
  UpdatePasswordValidator,
  FormState,
  GlobalKey<FormState>,
  TextEditingController
])
void main() {
  late UpdatePasswordViewModel viewmodel;
  late MockUpdatePasswordUseCase mockUpdatePasswordUseCase;
  late MockUpdatePasswordValidator mockUpdatePasswordValidator;
  late MockFormState mockFormState;
  late MockTextEditingController mockTextEditingController;
  late MockGlobalKey<FormState> mockUpdatePasswordFormKey;

  setUp(
        () {
          mockUpdatePasswordUseCase = MockUpdatePasswordUseCase();
          mockUpdatePasswordValidator = MockUpdatePasswordValidator();
      mockFormState = MockFormState();
      mockUpdatePasswordFormKey = MockGlobalKey<FormState>();
      mockTextEditingController = MockTextEditingController();

      viewmodel = UpdatePasswordViewModel(mockUpdatePasswordUseCase,mockUpdatePasswordValidator);

      when(mockUpdatePasswordValidator.updatePasswordFormKey)
          .thenReturn(mockUpdatePasswordFormKey);

      when(mockUpdatePasswordFormKey.currentState).thenReturn(mockFormState);

      when(mockUpdatePasswordValidator.currentPasswordController)
          .thenReturn(mockTextEditingController);


      when(mockUpdatePasswordValidator.newPasswordController)
          .thenReturn(mockTextEditingController);


      when(mockUpdatePasswordValidator.confirmPasswordController)
          .thenReturn(mockTextEditingController);


    },
  );
  group('UpdatePassword ViewModel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with UpdatePasswordIntent emits LoadingState, SuccessState on Success',
          () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Success<User?>(User()));

        when(mockUpdatePasswordUseCase.updatePassword(any))
            .thenAnswer((_) async => Success<User?>(User()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
        );

        viewmodel.doIntent(UpdatePasswordIntent("Farida987#","Farida988@"));
      },
    );

    test(
      'doIntent with UpdatePasswordIntent emits LoadingState on Fail',
          () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Fail<User?>(Exception()));

        when(mockUpdatePasswordUseCase.updatePassword(any))
            .thenAnswer((_) async => Fail<User?>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(UpdatePasswordIntent("Farida987#","Farida987#"));
      },
    );

    test(
      'doIntent with UpdatePasswordIntent emits LoadingState,  when UpdatePasswordFormKey is invalid',
          () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(UpdatePasswordIntent("Farida987#","Farida987#"));
      },
    );
  });
}
