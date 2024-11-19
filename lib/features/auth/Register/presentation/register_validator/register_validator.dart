import 'package:elevate_ecommerce/features/auth/Register/presentation/register_validator/register_validator_types_enum.dart';
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
  TextEditingController get confirmPasswordController => _confirmPasswordController;
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
        return  "Email Should Not Be Empty";
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return "Password Should Not Be Empty";
      } else if (!passwordRegExp.hasMatch(value)) {
        return "Password should have should have numbers & characters & special letters not less than 8 characters";
      }
      return null;
    };
  }

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Should Not Be Empty";
      }
      if (_passwordController.text != value) {
        return "Password not match";
      }
      return null;
    };
  }

  String? Function(String?) _validateFirstName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "First Name should not be empty";
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return "First Name must contain only letters";
      }
      return null;
    };
  }

  String? Function(String?) _validateLastName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Last Name should not be empty";
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return "Last Name must contain only letters";
      }
      return null;
    };
  }

  String? Function(String?) _validatePhone() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Phone number should not be empty";
      }
      if (!RegExp(r'^\+20\d{10}$').hasMatch(value)) {
        return "Phone number must start with '+20' followed by exactly 10 digits";
      }
      return null;
    };
  }

}