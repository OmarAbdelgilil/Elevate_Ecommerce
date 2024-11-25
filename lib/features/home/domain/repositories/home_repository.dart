import '../../../../core/common/api_result.dart';
import '../../data/models/response/product_response/ProductResponse.dart';

abstract class HomeRepository {

  Future<Result<ProductResponse?>> getAllProducts();
}
