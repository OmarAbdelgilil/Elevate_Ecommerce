import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/Dtos/categories_dto.dart';
import 'package:elevate_ecommerce/features/home/data/Dtos/occasions_dto.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api/api_execution.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  ApiManager apiManager;
  RemoteDatasourceImpl(this.apiManager);

  @override
  Future<Result<ProductResponse?>> getAllProducts() async {
    return executeApi(() async {
      final result = await apiManager.getAllProducts();
      return result;
    });
  }

  @override
  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts() {
    return executeApi(() async {
      var result = await apiManager.getAllBestSellerProducts();
      return result;
    });
  }

  @override
  Future<Result<Categories?>> getAllCategories() {
    return executeApi(() async {
      var result = await apiManager.getAllCategories();
      var categories = result?.categories;
      var categoriesDto = CategoriesDto(categories: categories!);
      return categoriesDto.toCategories();
    });
  }

  @override
  Future<Result<Occasions?>> getAllOccasions() {
    return executeApi(() async {
      var result = await apiManager.getAllOccasions();
      var occasions = result?.occasions;
      var ocaasionsDto = OccasionsDto(occations: occasions!);
      return ocaasionsDto.toOccasions();
    });
  }
}
