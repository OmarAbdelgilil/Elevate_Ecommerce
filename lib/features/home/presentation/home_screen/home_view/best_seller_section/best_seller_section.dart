import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/best_seller_section/best_seller_item.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/section_header.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerSection extends StatelessWidget {
  final List<ProductsModel>? bestsellerList;
  final Exception? exception;
  final bool loading;
  const BestSellerSection(
      {super.key, this.bestsellerList, this.exception, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
            title: 'Best seller',
            onpressed: () {
              Navigator.pushNamed(context, AppRoutes.bestSeller);
            }),
        if (loading)
          const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          ),
        if (bestsellerList != null)
          SizedBox(
            height: 220.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestsellerList!.length,
              itemBuilder: (context, index) => BestSellerItem(
                item: bestsellerList![index],
              ),
            ),
          )
      ],
    );
  }
}
