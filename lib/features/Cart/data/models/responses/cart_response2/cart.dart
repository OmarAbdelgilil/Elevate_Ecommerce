import 'cart_item.dart';

class Cart2 {
  String? id;
  String? user;
  List<CartItem>? cartItems;
  int? discount;
  int? totalPrice;
  int? totalPriceAfterDiscount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Cart2({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart2.fromJson(Map<String, dynamic> json) {
    return Cart2(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      discount: json['discount'] as int?,
      totalPrice: json['totalPrice'] as int?,
      totalPriceAfterDiscount: json['totalPriceAfterDiscount'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'cartItems': cartItems?.map((e) => e.toJson()).toList(),
        'discount': discount,
        'totalPrice': totalPrice,
        'totalPriceAfterDiscount': totalPriceAfterDiscount,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
