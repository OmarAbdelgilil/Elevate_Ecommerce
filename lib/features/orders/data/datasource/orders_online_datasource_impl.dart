import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/Cart/data/DTOs/product_dto.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart';
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
        final products = await Future.wait(
          result!.orders!.orderItems!.map(
                (e) async {
              final p = await apiManager.getProductDetails(e.product!);
              return ProductDto(
                id: p!.product!.id!,
                imgCover: p.product!.imgCover!,
                price: p.product!.price!,
                title: p.product!.title!,
              ).toProductModel();
            },
          ),
        );
        return OrdersDto(result.orders!, products.cast<ProductModel>()).toOrdersModel();
      },
    );
  }
}
