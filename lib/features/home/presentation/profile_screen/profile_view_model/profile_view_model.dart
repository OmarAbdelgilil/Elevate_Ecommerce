import 'package:elevate_ecommerce/core/cache/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {

  late final SharedPreferencesService _sharedPreferencesService;
  bool _isNotificationEnabled = false;
  String _selectedLanguage = 'English';

  bool get isNotificationEnabled => _isNotificationEnabled;
  String get selectedLanguage => _selectedLanguage;

  void toggleNotification(bool value) {
    _isNotificationEnabled = value;

    notifyListeners();
  }

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
