class UpdateCartProductQuantityRequest {
  int? quantity;

  UpdateCartProductQuantityRequest({this.quantity});

  factory UpdateCartProductQuantityRequest.fromJson(Map<String, dynamic> json) {
    return UpdateCartProductQuantityRequest(
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
      };
}
