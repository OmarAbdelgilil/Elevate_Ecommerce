import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/Order_response.dart';
import 'package:elevate_ecommerce/features/orders/domain/repos/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetOrdersUsecase(this._ordersRepository);
  Future<Result<OrderResponse?>> getOrders() async {
    return await _ordersRepository.getOrders();
  }


}
