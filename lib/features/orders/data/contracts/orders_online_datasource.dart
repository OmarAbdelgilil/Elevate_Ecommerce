import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';

abstract class OrdersOnlineDatasource {
  Future<Result<OrdersModel?>> getCart();
}
