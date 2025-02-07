import 'Orders.dart';

class OrderResponse {
  OrderResponse({
      this.message, 
      this.error,
      this.orders,});

  OrderResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  String? message;
  String? error;
  List<Orders>? orders;
OrderResponse copyWith({  String? message,
  List<Orders>? orders,
}) => OrderResponse(  message: message ?? this.message,error: error ?? this.error,
  orders: orders ?? this.orders,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }



}