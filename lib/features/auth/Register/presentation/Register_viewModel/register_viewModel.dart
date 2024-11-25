

import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/useCases/register_useCase.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_validator/register_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../user.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterScreenState> {
  final RegisterUseCase registerUseCase;
  final RegisterValidator registerValidator;

  RegisterViewModel(this.registerUseCase, this.registerValidator)
      : super(InitialState()) {
    registerValidator.attachListeners(_onFieldsChanged);
  }

  final ValueNotifier<bool> fieldsFilledNotifier = ValueNotifier(false);

  void _onFieldsChanged() {
    fieldsFilledNotifier.value = registerValidator.firstNameController.text.isNotEmpty &&
        registerValidator.lastNameController.text.isNotEmpty &&
        registerValidator.emailController.text.isNotEmpty &&
        registerValidator.phoneController.text.isNotEmpty &&
        registerValidator.passwordController.text.isNotEmpty &&
        registerValidator.confirmPasswordController.text.isNotEmpty;
  }

  void doIntent(RegisterScreenIntent intent) {
    switch (intent) {
      case RegisterIntent():
        _register(intent);
        break;
      case CheckfieldsInent():
        _checkfields();
        break;
    }
  }

  void _register(RegisterIntent intent) async {
    emit(LoadingState());
    if (!registerValidator.registerFormKey.currentState!.validate()) {
      emit(ErrorState(Exception("Invalid input")));
      return;
    }
    var result = await registerUseCase.register(RegisterRequest(
      email: registerValidator.emailController.text,
      firstName: registerValidator.firstNameController.text,
      lastName: registerValidator.lastNameController.text,
      password: registerValidator.passwordController.text,
      rePassword: registerValidator.confirmPasswordController.text,
      phone: registerValidator.phoneController.text,
      gender:intent.gender
    ));

    switch (result) {
      case Success<User?>():
        registerValidator.disposeFields();
        emit(SuccessState(result.data));
        break;
      case Fail<User?>():
        print("Registration failed: ${result.exception}");
        emit(ErrorState(result.exception));
        break;
    }

  }

  void _checkfields() {
    fieldsFilledNotifier.value = registerValidator.firstNameController.text.isNotEmpty &&
        registerValidator.lastNameController.text.isNotEmpty &&
        registerValidator.emailController.text.isNotEmpty &&
        registerValidator.phoneController.text.isNotEmpty &&
        registerValidator.passwordController.text.isNotEmpty &&
        registerValidator.confirmPasswordController.text.isNotEmpty;
  }
}


sealed class RegisterScreenIntent{}
class RegisterIntent extends RegisterScreenIntent{
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
  String gender;


  RegisterIntent(this.gender,this.firstName,this.lastName,this.email,this.password,this.rePassword,this.phone);
}

class CheckfieldsInent extends RegisterScreenIntent{

}

sealed class RegisterScreenState{}
class InitialState extends RegisterScreenState{}
class LoadingState extends RegisterScreenState{}

class ErrorState extends RegisterScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends RegisterScreenState{
  User? user;
  SuccessState(this.user);

}























