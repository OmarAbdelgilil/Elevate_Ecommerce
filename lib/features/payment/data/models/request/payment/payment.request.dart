import 'shipping_address.request.dart';

class PaymentRequest {
  ShippingAddress? shippingAddress;

  PaymentRequest({this.shippingAddress});

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
        shippingAddress: json['shippingAddress'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shippingAddress'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'shippingAddress': shippingAddress?.toJson(),
      };
}
