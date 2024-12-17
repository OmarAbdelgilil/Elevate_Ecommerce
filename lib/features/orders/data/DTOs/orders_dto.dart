import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/orders.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';

class OrdersDto {
  Orders orders;
  List<ProductModel> products;
  OrdersDto(this.orders, this.products);
  OrdersModel toOrdersModel() {
    for (var element in products) {
      element.price = orders.orderItems!
          .firstWhere(
            (e) => e.product == element.id,
          )
          .price!;
    }
    return OrdersModel(
        id: orders.id,
        isDelivered: orders.isDelivered,
        isPaid: orders.isPaid,
        orderItems: products,
        paymentType: orders.paymentType,
        totalPrice: orders.totalPrice,
        user: orders.user,
        v: orders.v);
  }
}
