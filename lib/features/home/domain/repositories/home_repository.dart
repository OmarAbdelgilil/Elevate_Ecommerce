import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/response/product_response/ProductResponse.dart';

abstract class HomeRepository {

  Future<Result<ProductResponse?>> getAllProducts();

  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts();
}
