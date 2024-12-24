class CartItem {
  String? product;
  int? price;
  int? quantity;
  String? id;

  CartItem({this.product, this.price, this.quantity, this.id});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'] is String ? json['product'] as String? : null,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product,
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
