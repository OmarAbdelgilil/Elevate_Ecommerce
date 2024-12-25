import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/dataSource/register_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterOnlineDatasource)
class RegisterOnlineDatasourceImpl implements RegisterOnlineDatasource {
  ApiManager apiManager;
  RegisterOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<RegisterResponse?>> register(RegisterRequest request) {
    return executeApi(() async {
      var result = await apiManager.register(request);
      return result;
    });
  }
}
