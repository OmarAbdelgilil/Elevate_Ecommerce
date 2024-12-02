import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  void clearUserData() {
    _userData = null;
    notifyListeners();
  }

  void updateUserData(Map<String, dynamic> updatedFields) {
    if (_userData != null) {
      _userData = UserData(
        wishlist: updatedFields['wishlist'] ?? _userData!.wishlist,
        id: updatedFields['_id'] ?? _userData!.id,
        firstName: updatedFields['firstName'] ?? _userData!.firstName,
        lastName: updatedFields['lastName'] ?? _userData!.lastName,
        email: updatedFields['email'] ?? _userData!.email,
        gender: updatedFields['gender'] ?? _userData!.gender,
        phone: updatedFields['phone'] ?? _userData!.phone,
        photo: updatedFields['photo'] ?? _userData!.photo,
        role: updatedFields['role'] ?? _userData!.role,
        createdAt: updatedFields['createdAt'] ?? _userData!.createdAt,
        passwordChangedAt:
            updatedFields['passwordChangedAt'] ?? _userData!.passwordChangedAt,
        addresses: updatedFields['addresses'] ?? _userData!.addresses,
      );
      notifyListeners();
    }
  }
}
