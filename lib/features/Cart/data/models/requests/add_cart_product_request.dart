class AddCartProductRequest {
  String? product;
  int? quantity;

  AddCartProductRequest({this.product, this.quantity});

  factory AddCartProductRequest.fromJson(Map<String, dynamic> json) {
    return AddCartProductRequest(
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product,
        'quantity': quantity,
      };
}
