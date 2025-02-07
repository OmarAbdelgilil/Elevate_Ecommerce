import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';

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
          height: 64,
          width: 68,
          decoration: const BoxDecoration(
              color: ColorManager.lightPink,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CachedNetworkImage(
             imageUrl:  category.image!,
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(strokeWidth: 1,),),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: 68,
          child: Center(
            child: Text(
              capitalizeFirstLetter(category.name!),
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
