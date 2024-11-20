import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';

abstract class HomeRepository {
  Future<Result<Categories?>> getAllCategories();
  Future<Result<Home?>> getHomePage();
}
