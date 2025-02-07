import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';

import '../../data/models/response/Order_response.dart';

abstract class OrdersRepository {
  Future<Result<OrderResponse?>>  getOrders();
}
