import 'package:elevate_ecommerce/features/orders/domain/models/order_item_model.dart';

class OrdersModel {
  String? id;
  String? user;
  List<OrderItemModel>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;

  int? v;

  OrdersModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.v,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        orderItems: (json['orderItems'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as int?,
        paymentType: json['paymentType'] as String?,
        isPaid: json['isPaid'] as bool?,
        isDelivered: json['isDelivered'] as bool?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'orderItems': orderItems?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'paymentType': paymentType,
        'isPaid': isPaid,
        'isDelivered': isDelivered,
        '__v': v,
      };
}
