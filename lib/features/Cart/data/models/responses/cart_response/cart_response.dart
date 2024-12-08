import 'cart.dart';

class CartResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  CartResponse({this.message, this.numOfCartItems, this.cart});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'numOfCartItems': numOfCartItems,
        'cart': cart?.toJson(),
      };
}
