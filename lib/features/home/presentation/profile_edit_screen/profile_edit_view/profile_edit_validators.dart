import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../utils/string_manager.dart';

enum EditProfileValidTypes {
  firstName,
  lastName,
  email,
  password,
  confirmPassword,
  phone
}

@injectable
class EditProfileValidator {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _editDataFormKey = GlobalKey<FormState>();
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  GlobalKey<FormState> get editDataFormKey => _editDataFormKey;

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

  String? Function(String?) validate(EditProfileValidTypes type) {
    switch (type) {
      case EditProfileValidTypes.firstName:
        return _validateFirstName();
      case EditProfileValidTypes.lastName:
        return _validateLastName();
      case EditProfileValidTypes.email:
        return _validateEmail();
      case EditProfileValidTypes.password:
        return _validatePassword();
      case EditProfileValidTypes.confirmPassword:
        return _validateConfirmPassword();
      case EditProfileValidTypes.phone:
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
        return StringsManager.issueEmptyEamil.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword.tr();
      } else if (!passwordRegExp.hasMatch(value)) {
        return StringsManager.issuePasswordPattern.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword.tr();
      }
      if (_passwordController.text != value) {
        return StringsManager.issuePasswordNotMatch.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validateFirstName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyFirstname.tr();
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return StringsManager.validateFirstNameType.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validateLastName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyLastname.tr();
      }
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
        return StringsManager.validateLastNameType.tr();
      }
      return null;
    };
  }

  String? Function(String?) _validatePhone() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPhone.tr();
      }
      if (!RegExp(r'^\+20\d{10}$').hasMatch(value)) {
        return StringsManager.validatePhoneNumber.tr();
      }
      return null;
    };
  }
}
