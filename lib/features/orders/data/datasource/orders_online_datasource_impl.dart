import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/orders/data/DTOs/orders_dto.dart';
import 'package:elevate_ecommerce/features/orders/data/contracts/orders_online_datasource.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersOnlineDatasource)
class OrdersOnlineDatasourceImpl implements OrdersOnlineDatasource {
  final ApiManager apiManager;
  OrdersOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<OrdersModel?>> getCart() {
    return executeApi(
      () async {
        final result = await apiManager.getOrders();
        return OrdersDto(result!.orders!).toOrdersModel();
      },
    );
  }
}
