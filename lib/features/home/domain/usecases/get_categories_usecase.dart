import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  final HomeRepository _homeRepository;
  GetCategoriesUsecase(this._homeRepository);

  Future<Result<Categories?>> getCategories() async {
    final result = await _homeRepository.getAllCategories();
    return result;
  }
}
