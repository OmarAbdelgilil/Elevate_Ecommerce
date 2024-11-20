import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHomepageUsecase {
  final HomeRepository _homeRepository;
  GetHomepageUsecase(this._homeRepository);

  Future<Result<Home?>> getCategories() async {
    final result = await _homeRepository.getHomePage();
    return result;
  }
}
