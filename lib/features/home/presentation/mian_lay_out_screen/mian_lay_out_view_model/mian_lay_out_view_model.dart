import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/category_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/home_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/profile_view/profile__screen.dart';
import '../../../../../utils/assets_manager.dart';


final dummyProduct = ProductsModel(
  id: '1',
  title: 'Test Product',
  price: 100,

);
class MainLayoutViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<TabItem> _tabs = [
    TabItem(icon: SVGAssets.homeTab, label: StringsManager.homeTab, screen: const HomeScreen()),
    TabItem(icon: SVGAssets.categoryTab, label: StringsManager.categoryTab, screen: const CategoryScreen()),
    TabItem(icon: SVGAssets.cardTab, label:StringsManager.cardTab, screen:  ProductDetailsScreen(productId:"673e2e1f1159920171828153",productDetails:dummyProduct,)),
    TabItem(icon: SVGAssets.personTab, label: StringsManager.profile, screen: const ProfileScreen()),
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
