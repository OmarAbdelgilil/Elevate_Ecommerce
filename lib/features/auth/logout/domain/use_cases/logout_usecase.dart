import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase {
  final LogoutRepo _logoutRepo;

  LogoutUsecase(this._logoutRepo);
  Future<Result<Logout?>> logout() async {
    return await _logoutRepo.logout();
  }
}
