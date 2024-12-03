import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/cart_screen/cart_view/cart_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/home_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/profile_view/profile__screen.dart';
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

  final List<TabItem> _tabs = [
    TabItem(
        icon: SVGAssets.homeTab,
        label: StringsManager.homeTab,
        screen: HomeScreen()),
    TabItem(
        icon: SVGAssets.categoryTab,
        label: StringsManager.categoryTab,
        screen: const CategoryScreen(
          selectedCategoryId: '',
        )),
    TabItem(
        icon: SVGAssets.cardTab,
        label: StringsManager.cardTab,
        screen: CartScreen()),
    TabItem(
        icon: SVGAssets.personTab,
        label: StringsManager.profile,
        screen: const ProfileScreen()),
  ];

  int get selectedIndex => _selectedIndex;

  List<TabItem> get tabs => _tabs;

  void onItemTapped(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  Widget get currentScreen => _tabs[_selectedIndex].screen;
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
