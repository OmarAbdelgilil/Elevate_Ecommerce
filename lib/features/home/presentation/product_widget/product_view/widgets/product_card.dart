import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_button.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/string_manager.dart';

class ProductGridItem extends StatelessWidget {
  final String productImage;
  final String title;
  final String description;
  final num price;
  final num priceAfterDiscount;
  final String disCount;
  final String id;

  const ProductGridItem({
    super.key,
    required this.productImage,
    required this.title,
    required this.description,
    required this.price,
    required this.priceAfterDiscount,
    required this.disCount,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorManager.grey),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8, right: AppPadding.p8, left: AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s16),
                    topRight: Radius.circular(AppSize.s16),
                  ),
                  child: CachedNetworkImage(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 1.7,
                    imageUrl: productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: AppSize.s5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.title(
                            fontSize: AppSize.s14, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: AppSize.s5),
                      Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p10),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${StringsManager.productPriceCurrency} $priceAfterDiscount",
                                style: AppTextStyles.price(
                                    color: ColorManager.black,
                                    fontSize: AppSize.s14,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(
                                width: AppSize.s4,
                              ),
                              Text("$price",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: ColorManager.darkGrey,
                                      fontSize: AppSize.s14,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: ColorManager.darkGrey,
                                      decorationThickness: 1,
                                    ),
                                  )),
                              const SizedBox(
                                width: AppSize.s4,
                              ),
                              Text(
                                disCount,
                                style: AppTextStyles.subtitle(
                                    color: ColorManager.green),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.s5),
                ProductButton(
                    productId: id,
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          SVGAssets.cardTab,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.white, BlendMode.srcIn),
                        ),
                        Text(
                          StringsManager.productButton,
                          style:
                              AppTextStyles.button(color: ColorManager.white),
                        )
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }

  String calculateDiscountPercentage(num price, num priceAfterDiscount) {
    if (price == 0 || priceAfterDiscount >= price) {
      return "0%";
    }

    double discount = ((price - priceAfterDiscount) / price) * 100;

    return "${discount.toStringAsFixed(0)}%"; // Rounds to the nearest integer
  }
}
