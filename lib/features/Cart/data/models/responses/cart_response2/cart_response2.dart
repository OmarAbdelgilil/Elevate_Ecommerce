import 'cart.dart';

class CartResponse2 {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  CartResponse2({this.message, this.numOfCartItems, this.cart});

  factory CartResponse2.fromJson(Map<String, dynamic> json) => CartResponse2(
        message: json['message'] as String?,
        numOfCartItems: json['numOfCartItems'] as int?,
        cart: json['cart'] == null
            ? null
            : Cart.fromJson(json['cart'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'numOfCartItems': numOfCartItems,
        'cart': cart?.toJson(),
      };
}
