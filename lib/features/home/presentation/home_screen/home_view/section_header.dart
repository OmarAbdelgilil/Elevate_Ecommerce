import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Function() onpressed;
  const SectionHeader({
    super.key,
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
              onPressed: onpressed,
              child: const Text(
                'View All',
                style: TextStyle(
                    color: ColorManager.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.primary),
              ))
        ],
      ),
    );
  }
}
