import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce/features/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepo _loginRepo;

  LoginUsecase(this._loginRepo);
  Future<Result<LoginResponse>> login(LoginRequest request) async {
    return await _loginRepo.login(request);
  }
}
