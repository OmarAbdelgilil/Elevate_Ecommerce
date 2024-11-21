import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';

abstract class RemoteDatasource {
  Future<Result<Categories?>> getAllCategories();
}
