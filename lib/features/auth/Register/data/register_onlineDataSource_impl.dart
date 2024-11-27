import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/register_onlineDataSource.dart';
import 'package:elevate_ecommerce/features/auth/user.dart';
import 'package:elevate_ecommerce/features/auth/user_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterOnlineDatasource)
class RegisterOnlineDatasourceImpl implements RegisterOnlineDatasource {
  ApiManager apiManager;
  RegisterOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<User?>> register(RegisterRequest request) {
    return executeApi(() async {
      var result = await apiManager.register(request);
      var user = result.user;
      var userDto = UserDto(isVerified: user?.isVerified, token: result.token);
      return userDto.toUser();
    });
  }
}



