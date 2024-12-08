import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart';

class CartItemModel {
  ProductModel? product;
  int? price;
  int? quantity;
  String? id;

  CartItemModel({this.product, this.price, this.quantity, this.id});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        product: json['product'] == null
            ? null
            : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'price': price,
        'quantity': quantity,
        '_id': id,
      };
}
