import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';

abstract class ProductDetails_Onlinedatasource {
  Future<Result<ProductDetailsResponse?>> getProductDetails(String productId);


}
