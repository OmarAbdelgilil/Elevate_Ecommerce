import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/orders.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/order_item_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';

class OrdersDto {
  Orders orders;
  OrdersDto(this.orders);
  OrdersModel toOrdersModel() {
    final orderItems = orders.orderItems!
        .map(
          (e) => OrderItemModel(
              id: e.id,
              price: e.price,
              product: e.product,
              quantity: e.quantity),
        )
        .toList();
    return OrdersModel(
        id: orders.id,
        isDelivered: orders.isDelivered,
        isPaid: orders.isPaid,
        orderItems: orderItems,
        paymentType: orders.paymentType,
        totalPrice: orders.totalPrice,
        user: orders.user,
        v: orders.v);
  }
}
