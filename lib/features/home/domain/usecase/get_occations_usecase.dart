import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOccasionsUsecase {
  final HomeRepository _homeRepository;
  GetOccasionsUsecase(this._homeRepository);
  Future<Result<Occasions?>> getAllOccasions() async {
    final result = await _homeRepository.getAllOccasions();
    return result;
  }
}
