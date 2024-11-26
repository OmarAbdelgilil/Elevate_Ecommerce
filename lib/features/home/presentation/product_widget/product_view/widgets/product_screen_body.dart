import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_card.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view_model/product_view_model.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/material.dart';
class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key, required this.viewModel});

  final ProductViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int columns = screenWidth > AppSize.s600 ? 3 : 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 16/25.5,
      ),
      itemCount: viewModel.getProducts.length,
      itemBuilder: (context, index) {
        final product = viewModel.getProducts[index];
        String discountPercentage = calculateDiscountPercentage(product.price??0, product.priceAfterDiscount??0);

        return ProductGridItem(
          productImage: product.images?[0] ?? '',
          title: product.title ?? '',
          description: product.description ?? '',
          price: product.price ?? 0.0,
          priceAfterDiscount:product.priceAfterDiscount ?? 0.0 ,
          disCount: discountPercentage,
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
