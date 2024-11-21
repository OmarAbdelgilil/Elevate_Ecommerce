import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIcon extends StatelessWidget {
  final CategoryModel category;
  const CategoryIcon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    String capitalizeFirstLetter(String input) {
      if (input.isEmpty) return input;
      return input[0].toUpperCase() + input.substring(1);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 64.h,
          width: 68.w,
          decoration: const BoxDecoration(
              color: ColorManager.lightPink,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.network(
              category.image!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: 68.w,
          child: Center(
            child: Text(
              capitalizeFirstLetter(category.name!),
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
