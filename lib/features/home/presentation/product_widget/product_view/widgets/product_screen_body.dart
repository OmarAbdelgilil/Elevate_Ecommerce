import 'package:flutter/material.dart';
import '../../../../data/models/response/product_response/Products.dart';
import 'product_card.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';

class ProductScreenBody extends StatelessWidget {
  final List<Products> products;

  const ProductScreenBody({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int columns = screenWidth > AppSize.s600 ? 3 : 2;

    return products.isEmpty
        ? Center(child: Text('No products found'))
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

        return ProductGridItem(
          productImage: product.images?.isNotEmpty == true
              ? product.images![0]
              : '',
          title: product.title ?? '',
          description: product.description ?? '',
          price: product.price ?? 0.0,
          priceAfterDiscount: product.priceAfterDiscount ?? 0.0,
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
