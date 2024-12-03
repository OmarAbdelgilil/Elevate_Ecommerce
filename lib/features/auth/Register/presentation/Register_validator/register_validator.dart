import 'package:elevate_ecommerce/features/auth/Register/presentation/register_validator/register_validator_types_enum.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterValidator {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  GlobalKey<FormState> get registerFormKey => _registerFormKey;

  void attachListeners(VoidCallback onFieldsChanged) {
    _firstNameController.addListener(onFieldsChanged);
    _lastNameController.addListener(onFieldsChanged);
    _emailController.addListener(onFieldsChanged);
    _phoneController.addListener(onFieldsChanged);
    _passwordController.addListener(onFieldsChanged);
    _confirmPasswordController.addListener(onFieldsChanged);
  }

  void disposeFields() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
  }

  String? Function(String?) validate(RegisterValidTypes type) {
    switch (type) {
      case RegisterValidTypes.firstName:
        return _validateFirstName();
      case RegisterValidTypes.lastName:
        return _validateLastName();
      case RegisterValidTypes.email:
        return _validateEmail();
      case RegisterValidTypes.password:
        return _validatePassword();
      case RegisterValidTypes.confirmPassword:
        return _validateConfirmPassword();
      case RegisterValidTypes.phone:
        return _validatePhone();
      default:
        return (String? value) {
          return null;
        };
    }
  }

  String? Function(String?) _validateEmail() {
    return (String? value) {
      if (value != null && (value.isEmpty || !value.contains("@"))) {
        return StringsManager.issueEmptyEamil;
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword;
      } else if (!passwordRegExp.hasMatch(value)) {
        return StringsManager.issuePasswordPattern;
      }
      return null;
    };
  }

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword;
      }
      if (_passwordController.text != value) {
        return StringsManager.issuePasswordNotMatch;
      }
      return null;
    };
  }

  String? Function(String?) _validateFirstName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyFirstname;
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return StringsManager.validateFirstNameType;
      }
      return null;
    };
  }

  String? Function(String?) _validateLastName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyLastname;
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return StringsManager.validateLastNameType;
      }
      return null;
    };
  }

  String? Function(String?) _validatePhone() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPhone;
      }
      if (!RegExp(r'^\+20\d{10}$').hasMatch(value)) {
        return StringsManager.validatePhoneNumber;
      }
      return null;
    };
  }
}
