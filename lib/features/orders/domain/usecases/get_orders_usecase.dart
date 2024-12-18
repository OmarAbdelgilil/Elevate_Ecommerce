import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/repos/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersUsecase {
  final OrdersRepository _ordersRepository;
  GetOrdersUsecase(this._ordersRepository);
  Future<Result<OrdersModel?>> getOrders() async {
    return await _ordersRepository.getOrders();
  }
}
