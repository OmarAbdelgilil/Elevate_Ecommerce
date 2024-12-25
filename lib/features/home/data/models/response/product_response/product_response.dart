import 'Products.dart';

class ProductResponse {
  ProductResponse({
    this.message,
    this.products,
  });

  ProductResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? message;
  List<Products>? products;
  ProductResponse copyWith({
    String? message,
    List<Products>? products,
  }) =>
      ProductResponse(
        message: message ?? this.message,
        products: products ?? this.products,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
