import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'product_card.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';

class ProductScreenBody extends StatelessWidget {
  final List<ProductsModel> products;

  const ProductScreenBody({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int columns = screenWidth > AppSize.s600 ? 3 : 2;

    return products.isEmpty
        ? Center(
            child: Column(
            children: [
              Lottie.asset(LottieAssets.noContent),
              Text(
                StringsManager.noProductsFound,
                style: AppTextStyles.title(),
              ),
            ],
          ))
        : GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 16 / 25.5,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              String discountPercentage = calculateDiscountPercentage(
                  product.price ?? 0, product.priceAfterDiscount ?? 0);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                            productId: product.id!, product: product),
                      ));
                },
                child: ProductGridItem(
                  id: product.id!,
                  productImage: product.imgCover ?? '',
                  title: product.title ?? '',
                  description: product.description ?? '',
                  price: product.price ?? 0.0,
                  priceAfterDiscount: product.priceAfterDiscount ?? 0.0,
                  disCount: discountPercentage,
                ),
              );
            },
          );
  }

  String calculateDiscountPercentage(int price, num priceAfterDiscount) {
    if (price == 0 || priceAfterDiscount >= price) {
      return "0%";
    }

    double discount = ((price - priceAfterDiscount) / price) * 100;

    return "${discount.toStringAsFixed(0)}%";
  }
}
