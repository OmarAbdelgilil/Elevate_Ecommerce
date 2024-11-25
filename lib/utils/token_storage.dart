import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final String _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    print('Saving token: $token');
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
    } catch (e) {
      throw Exception('Failed to save token: $e');
    }
  }

  Future<String?> getToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      print('Retrieved token: $token');
      return token;
    } catch (e) {
      throw Exception('Failed to retrieve token: $e');
    }
  }

  Future<void> deleteToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
    } catch (e) {
      throw Exception('Failed to delete token: $e');
    }
  }
}
