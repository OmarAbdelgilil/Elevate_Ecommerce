import 'order.dart';

class CreateOrder {
	String? message;
	Order? order;

	CreateOrder({this.message, this.order});

	factory CreateOrder.fromJson(Map<String, dynamic> json) => CreateOrder(
				message: json['message'] as String?,
				order: json['order'] == null
						? null
						: Order.fromJson(json['order'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'order': order?.toJson(),
			};
}
