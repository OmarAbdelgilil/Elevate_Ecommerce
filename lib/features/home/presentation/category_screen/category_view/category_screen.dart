import 'package:flutter/material.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import '../../product_widget/product_view/product_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Category> categories = [
      Category(id: "673c46fd1159920171827c85", name: "Flowers"),
      Category(id: "673c46fd1159920171827c86", name: "Gifts"),
      Category(id: "673c46fd1159920171827c87", name: "Decorations"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: ColorManager.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      filterType: "category",
                      id: category.id,
                    ),
                  ),
                );
              },
              child: Card(
                color: ColorManager.primary.withOpacity(0.1),
                child: Center(
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: AppSize.s18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Mock Category model class
class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}
