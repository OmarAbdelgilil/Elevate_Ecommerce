import 'order_item.dart';

class Order {
	String? user;
	List<OrderItem>? orderItems;
	int? totalPrice;
	String? paymentType;
	bool? isPaid;
	bool? isDelivered;
	String? id;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;

	Order({
		this.user, 
		this.orderItems, 
		this.totalPrice, 
		this.paymentType, 
		this.isPaid, 
		this.isDelivered, 
		this.id, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory Order.fromJson(Map<String, dynamic> json) => Order(
				user: json['user'] as String?,
				orderItems: (json['orderItems'] as List<dynamic>?)
						?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
						.toList(),
				totalPrice: json['totalPrice'] as int?,
				paymentType: json['paymentType'] as String?,
				isPaid: json['isPaid'] as bool?,
				isDelivered: json['isDelivered'] as bool?,
				id: json['_id'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'user': user,
				'orderItems': orderItems?.map((e) => e.toJson()).toList(),
				'totalPrice': totalPrice,
				'paymentType': paymentType,
				'isPaid': isPaid,
				'isDelivered': isDelivered,
				'_id': id,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
			};
}
