import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  final BestSellerModel item;
  const BestSellerItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
