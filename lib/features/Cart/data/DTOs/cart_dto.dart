import 'package:elevate_ecommerce/features/Cart/data/DTOs/cart_item_dto.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_item.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';

class CartDto {
  int? numOfCartItems;
  String? id;
  String? user;
  List<CartItem>? cartItems;
  int? totalPrice;

  CartDto(
      {this.cartItems,
      this.id,
      this.user,
      this.totalPrice,
      this.numOfCartItems});

  CartModel toCartModel() {
    final cartItemsModel = cartItems!
        .map((e) => CartItemDto(
                id: e.id,
                price: e.price,
                product: e.product,
                quantity: e.quantity)
            .toCartItemModel())
        .toList();
    return CartModel(
        cartItems: cartItemsModel,
        id: id,
        numOfCartItems: numOfCartItems,
        totalPrice: totalPrice,
        user: user);
  }
}
