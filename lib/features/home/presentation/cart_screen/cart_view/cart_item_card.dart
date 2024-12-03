import 'package:elevate_ecommerce/features/Cart/domain/model/cart_item.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel product;
  final CartViewmodel viewModel;
  const CartItemCard(
      {super.key, required this.product, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image
            Container(
              height: 101,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product
                      .product!.imgCover!), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            // Text and details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.product!.title!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.product!.slug!,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'EGP ${product.product!.price}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    viewModel.doIntent(RemoveItemIntent(product.product!.id!));
                  },
                  icon: Icon(Icons.delete_sharp, color: Colors.red),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (product.quantity! == 1) {
                          viewModel
                              .doIntent(RemoveItemIntent(product.product!.id!));
                        } else {
                          viewModel.doIntent(UpdateQuantityIntent(
                              productId: product.product!.id!,
                              quantity: product.quantity! - 1));
                        }
                      },
                      icon: Icon(Icons.remove, color: Colors.black),
                    ),
                    Text(
                      product.quantity.toString(), // Replace with dynamic value
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.doIntent(UpdateQuantityIntent(
                            productId: product.product!.id!,
                            quantity: product.quantity! + 1));
                      },
                      icon: Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
