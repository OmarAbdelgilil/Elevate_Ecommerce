import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';

import '../models/response/Order_response.dart';

abstract class OrdersOnlineDatasource {
  Future<Result<OrderResponse?>> getCart();
}
