import 'package:elevate_ecommerce/core/cache/hive_service.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/core/providers/user_provider.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:elevate_ecommerce/utils/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends ChangeNotifier {
  final LogoutUsecase _logoutUsecase;

  bool _isNotificationEnabled = false;
  String _selectedLanguage = 'English';
  bool _isLoggingOut = false;

  ProfileViewModel(this._logoutUsecase);

  bool get isNotificationEnabled => _isNotificationEnabled;
  String get selectedLanguage => _selectedLanguage;
  bool get isLoggingOut => _isLoggingOut;

  void toggleNotification(bool value) {
    _isNotificationEnabled = value;
    notifyListeners();
  }

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggingOut = true;
    notifyListeners();

    final result = await _logoutUsecase.logout();
    print('Logout result: $result');
    _isLoggingOut = false;

    if (result is Success<Logout?>) {
      final token = TokenProvider().token;
      try {
        HiveService().clearUser(token!);
        UserProvider().clearUserData();
        TokenProvider().clearToken();
        TokenStorage().deleteToken();
      } on Exception catch (e) {
        print(e);
      }
    } else if (result is Fail) {
      print('Logout failed:');
    }

    notifyListeners();
  }
}
