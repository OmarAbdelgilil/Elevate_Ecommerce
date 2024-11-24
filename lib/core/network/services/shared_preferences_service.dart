import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/home/data/models/response/product_response/Products.dart';
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@singleton
class SharedPreferencesService {
  static const String _cachedProductsKey = 'cached_products';
  static const String _cacheTimestampKey = 'cache_timestamp';
  static const Duration _cacheExpirationDuration = Duration(hours: 1);

  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  Future<void> cacheProducts(List<Products> products) async {
    try {
      final productsJson = json.encode(products.map((product) => product.toJson()).toList());
      await _prefs.setString(_cachedProductsKey, productsJson);

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      await _prefs.setInt(_cacheTimestampKey, timestamp);
    } catch (e) {
      print("Error caching products: $e");
    }
  }

  bool _isCacheExpired() {
    final timestamp = _prefs.getInt(_cacheTimestampKey);
    if (timestamp == null) return true;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime.now().isAfter(cacheTime.add(_cacheExpirationDuration));
  }

  Future<List<Products>?> getCachedProducts() async {
    try {
      if (_isCacheExpired()) {
        return null;
      }

      final cachedData = _prefs.getString(_cachedProductsKey);
      if (cachedData != null) {
        final List<dynamic> decodedData = json.decode(cachedData);
        return decodedData.map((e) => Products.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error retrieving cached products: $e");
    }
    return null;
  }

  Future<void> clearCache() async {
    try {
      await _prefs.remove(_cachedProductsKey);
      await _prefs.remove(_cacheTimestampKey);
    } catch (e) {
      if (kDebugMode) {
        print("Error clearing cache: $e");
      }
    }
  }
}
