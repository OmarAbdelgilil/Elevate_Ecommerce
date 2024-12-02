import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLogedUserDataUsecase {
  final GetLoggedUserDataRepo _getLogedUserDataRepo;

  GetLogedUserDataUsecase(this._getLogedUserDataRepo);
  Future<Result<UserResponse?>> getLogedUserData() async {
    return await _getLogedUserDataRepo.getLoggedUserData();
  }
}
