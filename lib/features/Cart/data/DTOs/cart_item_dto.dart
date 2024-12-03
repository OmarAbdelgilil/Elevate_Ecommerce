import 'package:elevate_ecommerce/features/Cart/data/DTOs/product_dto.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/product.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_item.dart';

class CartItemDto {
  Product? product;
  int? price;
  int? quantity;
  String? id;

  CartItemDto({this.id, this.price, this.product, this.quantity});

  CartItemModel toCartItemModel() {
    return CartItemModel(
        id: id,
        price: price,
        product: ProductDto(
          id: product!.id,
          title: product!.title,
          slug: product!.slug,
          description: product!.description,
          imgCover: product!.imgCover,
          images: product!.images,
          price: price,
          priceAfterDiscount: product!.priceAfterDiscount,
          quantity: quantity,
          category: product!.category,
          occasion: product!.occasion,
          v: product!.v,
        ).toProductModel(),
        quantity: quantity);
  }
}
