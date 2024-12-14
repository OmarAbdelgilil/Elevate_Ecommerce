class OrderItemModel {
  String? product;
  int? price;
  int? quantity;
  String? id;

  OrderItemModel({this.product, this.price, this.quantity, this.id});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        product: json['product'] as String?,
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
