import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';

class ProductDetailsResponse {
  ProductDetailsResponse({
    this.message,
    this.product, // Renamed 'products' to 'product' for single product
  });

  ProductDetailsResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['product'] != null) {
      product =
          Products.fromJson(json['product']); // Mapping to the 'product' field
    }
  }

  String? message;
  Products? product; // Single product instead of a list

  ProductDetailsResponse copyWith({
    String? message,
    Products? product,
  }) =>
      ProductDetailsResponse(
        message: message ?? this.message,
        product: product ?? this.product,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (product != null) {
      map['product'] =
          product?.toJson(); // Adjusted for 'product' instead of 'products'
    }
    return map;
  }
}
