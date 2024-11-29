import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';

import '../../../../core/common/api_result.dart';
import '../models/response/product_response/ProductResponse.dart';

abstract class RemoteDatasource {
  Future<Result<ProductResponse?>> getAllProducts();
  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts();
  Future<Result<Categories?>> getAllCategories();
  Future<Result<Occasions?>> getAllOccasions();
}
