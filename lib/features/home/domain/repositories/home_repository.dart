import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/response/product_response/ProductResponse.dart';

abstract class HomeRepository {
  Future<Result<ProductResponse?>> getAllProducts();

  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts();
  Future<Result<Categories?>> getAllCategories();
  Future<Result<Occasions?>> getAllOccasions();
}
