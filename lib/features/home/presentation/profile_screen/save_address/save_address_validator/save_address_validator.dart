class AppValidators {
  AppValidators._();

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'pleas enter your phone number';
    } else if (val.trim().isEmpty) {
      return 'pleas enter your phone number';
    } else if (int.tryParse(val.trim()) == null) {
      return 'pleas enter your phone number';
    } else if (val.trim().length != 11) {
      return 'pleas enter valid phone number';
    } else {
      return null;
    }
  }

  static String? validateNotEmpty(String? val) {
    if (val == null) {
      return 'pleas enter this text field';
    } else if (val.trim().isEmpty) {
      return 'pleas enter this text field';
    } else {
      return null;
    }
  }
}
