import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/best_seller.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  final ProductsModel item;
  const BestSellerItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                product: item,
                productId: item.id!,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.imgCover!,
              width: 131.w,
              height: 151.h,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 131.w,
              child: Text(
                item.title!,
                style: TextStyle(fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "${item.price} EGP",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
