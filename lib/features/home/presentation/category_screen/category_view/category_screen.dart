import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import '../../product_widget/product_view/product_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(id: "673c46fd1159920171827c85", name: "Flowers"),
      Category(id: "673c46fd1159920171827c86", name: "Gifts"),
      Category(id: "673c46fd1159920171827c87", name: "Decorations"),
    ];

    return DefaultTabController(
      length: categories.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          backgroundColor: ColorManager.primary,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              const Tab(text: "All"),
              ...categories.map((category) => Tab(text: category.name)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductScreen(filterType: "all", id: ""),
            ...categories.map((category) {
              return ProductScreen(filterType: "category", id: category.id);
            }).toList(),
          ],
        ),
      ),
    );
  }
}

// Category model
class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}
