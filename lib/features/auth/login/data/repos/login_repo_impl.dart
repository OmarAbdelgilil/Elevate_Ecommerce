import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/login/data/contracts/login_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce/features/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginOnlineDatasource _loginOnlineDatasource;

  LoginRepoImpl(this._loginOnlineDatasource);
  @override
  Future<Result<LoginResponse>> login(LoginRequest request) {
    return _loginOnlineDatasource.login(request);
  }
}
