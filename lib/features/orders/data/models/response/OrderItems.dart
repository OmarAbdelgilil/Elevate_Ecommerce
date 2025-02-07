import 'Product.dart';

class OrderItems {
  OrderItems({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return OrderItems(
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      price: json['price'] as num? ?? 0,
      quantity: json['quantity'] as num? ?? 0,
      id: json['_id'] ?? '',
    );
  }

  final Product? product;
  final num price;
  final num quantity;
  final String id;

  OrderItems copyWith({
    Product? product,
    num? price,
    num? quantity,
    String? id,
  }) {
    return OrderItems(
      product: product ?? this.product,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product?.toJson(),
      'price': price,
      'quantity': quantity,
      '_id': id,
    };
  }
}
