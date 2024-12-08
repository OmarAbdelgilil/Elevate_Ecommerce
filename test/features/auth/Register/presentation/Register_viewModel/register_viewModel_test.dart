import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/useCases/register_useCase.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_validator/register_validator.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_viewModel/register_viewModel.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_viewmodel_test.mocks.dart';

@GenerateMocks([
  RegisterUseCase,
  RegisterValidator,
  FormState,
  GlobalKey<FormState>,
  TextEditingController
])
void main() {
  late RegisterViewModel viewmodel;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockRegisterValidator mockRegisterValidator;
  late MockFormState mockFormState;
  late MockTextEditingController mockTextEditingController;
  late MockGlobalKey<FormState> mockRegisterFormKey;

  setUp(
    () {
      mockRegisterUseCase = MockRegisterUseCase();
      mockRegisterValidator = MockRegisterValidator();
      mockFormState = MockFormState();
      mockRegisterFormKey = MockGlobalKey<FormState>();
      mockTextEditingController = MockTextEditingController();

      viewmodel = RegisterViewModel(mockRegisterUseCase, mockRegisterValidator);

      when(mockRegisterValidator.registerFormKey)
          .thenReturn(mockRegisterFormKey);

      when(mockRegisterFormKey.currentState).thenReturn(mockFormState);

      when(mockRegisterValidator.firstNameController)
          .thenReturn(mockTextEditingController);

      when(mockRegisterValidator.lastNameController)
          .thenReturn(mockTextEditingController);

      when(mockRegisterValidator.emailController)
          .thenReturn(mockTextEditingController);

      when(mockRegisterValidator.passwordController)
          .thenReturn(mockTextEditingController);

      when(mockRegisterValidator.confirmPasswordController)
          .thenReturn(mockTextEditingController);

      when(mockRegisterValidator.phoneController)
          .thenReturn(mockTextEditingController);
    },
  );
  group('Register ViewModel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with RegisterIntent emits LoadingState and SuccessState on success',
      () async {
        when(mockFormState.validate()).thenReturn(true);

        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        provideDummy<Result<RegisterResponse?>>(
            Success<RegisterResponse?>(RegisterResponse()));

        when(mockRegisterUseCase.register(any))
            .thenAnswer((_) async => Success<RegisterResponse?>(
                  RegisterResponse(
                    token: "dummyToken",
                    user: User(
                      id: "1",
                      firstName: "Farida",
                      lastName: "Tarek",
                      email: "faridaelamret73@gmail.com",
                    ),
                  ),
                ));

        expectLater(
          viewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessState>().having((state) => state.user?.email,
                'user email', 'faridaelamret73@gmail.com'),
          ]),
        );

        viewmodel.doIntent(RegisterIntent(
          "female",
          "Farida",
          "Tarek",
          "faridaelamret73@gmail.com",
          "Farida987#",
          "Farida987#",
          "+201001319285",
        ));
      },
    );

    test(
      'doIntent with RegisterIntent emits LoadingState on Fail',
      () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<RegisterResponse?>>(
            Fail<RegisterResponse?>(Exception()));
        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        when(mockRegisterUseCase.register(any))
            .thenAnswer((_) async => Fail<RegisterResponse?>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(RegisterIntent(
            "female",
            "Farida",
            "Tarek",
            "faridaelamret73@gmail.com",
            "Farida987#",
            "Farida987#",
            "+201001319285"));
      },
    );

    test(
      'doIntent with RegisterIntent emits LoadingState  when RegisterFormKey is invalid',
      () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(RegisterIntent(
            "female",
            "Farida",
            "Tarek",
            "faridaelamret73@gmail.com",
            "Farida987#",
            "Farida987#",
            "+201001319285"));
      },
    );
  });
}
