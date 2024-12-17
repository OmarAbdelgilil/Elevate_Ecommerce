import 'orders.dart';

class OrderResponse {
  String? message;
  Orders? orders;

  OrderResponse({this.message, this.orders});

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        message: json['message'] as String?,
        orders: json['orders'] == null
            ? null
            : Orders.fromJson(json['orders'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'orders': orders?.toJson(),
      };
}
