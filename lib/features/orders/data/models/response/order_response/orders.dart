import 'order_item.dart';

class Orders {
  String? id;
  String? user;
  List<OrderItem>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Orders({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        orderItems: (json['orderItems'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalPrice'] as int?,
        paymentType: json['paymentType'] as String?,
        isPaid: json['isPaid'] as bool?,
        isDelivered: json['isDelivered'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
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
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
