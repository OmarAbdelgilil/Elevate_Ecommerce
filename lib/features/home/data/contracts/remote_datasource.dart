import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';

abstract class RemoteDatasource {
  Future<Result<Categories?>> getAllCategories();
  Future<Result<Home?>> getHomePage();
  Future<Result<ProductResponse?>> getAllProducts();
  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts();
  Future<Result<Occasions?>> getAllOccasions();
}
