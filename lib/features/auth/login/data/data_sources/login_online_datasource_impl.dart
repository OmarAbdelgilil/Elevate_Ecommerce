import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/login/data/contracts/login_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginOnlineDatasource)
class LoginOnlineDatasourceImpl implements LoginOnlineDatasource {
  ApiManager apiManager;

  LoginOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<LoginResponse>> login(LoginRequest request) {
    return executeApi(() async {
      var result = await apiManager.login(request);
      return result;
    });
  }
}
