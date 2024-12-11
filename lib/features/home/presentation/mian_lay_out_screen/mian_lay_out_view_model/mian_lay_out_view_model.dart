import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/cart_screen/cart_view/cart_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/home_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/profile_view/profile__screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../utils/assets_manager.dart';

final dummyProduct = ProductsModel(
    id: '1',
    title: 'Test Product',
    price: 100,
    description: "llll",
    images: ["kkkk", "kkkkkk"],
    quantity: 900,
    priceAfterDiscount: 90);

class MainLayoutViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  String _currentLanguage;

  static const String _languageKey = 'selected_language';

  MainLayoutViewModel() : _currentLanguage = _getDeviceLocale() {
    _loadLanguage();
  }

  int get selectedIndex => _selectedIndex;
  String get currentLanguage => _currentLanguage;

  List<TabItem> _getTabs() {
    return [
      TabItem(
        icon: SVGAssets.homeTab,
        label: StringsManager.homeTab.tr(),
        screen: HomeScreen(),
      ),
      TabItem(
        icon: SVGAssets.categoryTab,
        label: StringsManager.categoryTab.tr(),
        screen: const CategoryScreen(selectedCategoryId: ''),
      ),
      TabItem(
        icon: SVGAssets.cardTab,
        label: StringsManager.cardTab.tr(),
        screen: CartScreen(),
      ),
      TabItem(
        icon: SVGAssets.personTab,
        label: StringsManager.profile.tr(),
        screen: ProfileScreen(),
      ),
    ];
  }

  List<TabItem> get tabs => _getTabs();

  void onItemTapped(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void setLanguage(String language) async {
    if (language != _currentLanguage) {
      _currentLanguage = language;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, language);
    }
  }

  Widget get currentScreen => tabs[_selectedIndex].screen;

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      _currentLanguage = savedLanguage;
      notifyListeners();
    }
  }

  static String _getDeviceLocale() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    return deviceLocale.languageCode;
  }
}

class TabItem {
  final String icon;
  final String label;
  final Widget screen;

  TabItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
