import '../../../../core/common/api_result.dart';
import '../models/response/product_response/ProductResponse.dart';

abstract class RemoteDatasource {
  Future<Result<ProductResponse?>> getAllProducts();
}
