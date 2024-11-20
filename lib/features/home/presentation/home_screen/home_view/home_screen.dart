import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/categories_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/home_app_bar.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/location.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: const Padding(
        padding: EdgeInsets.only(left: 16, top: 10),
        child: Column(
          children: [Location(), CategoriesSection()],
        ),
      ),
    );
  }
}
