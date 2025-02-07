import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/data/contracts/orders_online_datasource.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/Order_response.dart';
import 'package:elevate_ecommerce/features/orders/domain/repos/orders_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersOnlineDatasource _ordersOnlineDatasource;
  OrdersRepositoryImpl(this._ordersOnlineDatasource);

  @override
  Future<Result<OrderResponse?>> getOrders() async {
    return await _ordersOnlineDatasource.getCart();
  }



}
