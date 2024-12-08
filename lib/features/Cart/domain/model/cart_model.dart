import 'package:elevate_ecommerce/features/Cart/domain/model/cart_item.dart';

class CartModel {
  int? numOfCartItems;
  String? id;
  String? user;
  List<CartItemModel>? cartItems;
  int? totalPrice;
  CartModel(
      {this.id,
      this.numOfCartItems,
      this.user,
      this.cartItems,
      this.totalPrice});
}
