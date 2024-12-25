import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/product_details_onlinedatasource.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsOnlinedatasource)
class ProductDetailsOnlinedatasourceImpl
    implements ProductDetailsOnlinedatasource {
  final ApiManager apiManager;

  ProductDetailsOnlinedatasourceImpl(this.apiManager);

  @override
  Future<Result<ProductDetailsResponse?>> getProductDetails(String productId) {
    return executeApi(() async {
      var result = await apiManager.getProductDetails(productId);
      return result;
    });
  }
}
