import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class TokenProvider with ChangeNotifier {
  static final TokenProvider _instance = TokenProvider._internal();
  factory TokenProvider() => _instance;

  TokenProvider._internal();

  String? _token;
  String? get token => _token;

  void saveToken(String token) {
    _token = token;
    notifyListeners();
  }

  void clearToken() {
    _token = null;
    notifyListeners();
  }
}
