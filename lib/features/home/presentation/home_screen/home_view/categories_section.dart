import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/section_header.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SectionHeader(title: 'Categories', onpressed: () {})],
    );
  }
}
