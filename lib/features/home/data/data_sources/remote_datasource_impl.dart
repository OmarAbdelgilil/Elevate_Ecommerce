import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/DTOs/categories_DTO.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:injectable/injectable.dart';

import '../contracts/remote_datasource.dart';

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  ApiManager apiManager;
  RemoteDatasourceImpl(this.apiManager);

  @override
  Future<Result<Categories?>> getAllCategories() {
    return executeApi(() async {
      var result = await apiManager.getAllCategories();
      var categories = result?.categories;
      var categoriesDto = CategoriesDto(categories: categories!);
      return categoriesDto.toCategories();
    });
  }
}
