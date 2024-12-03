import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/data/DTOs/user_dto.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdatePasswordOnlineDatasource)
class UpdatePasswordOnlineDatasourceImpl implements UpdatePasswordOnlineDatasource {
  ApiManager apiManager;
  UpdatePasswordOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) {
    return executeApi(() async {
      var result = await apiManager.updatePassword(request);
      var user = result.user;
      var userDto = UserDto(isVerified: user?.isVerified, token: result.token);
      return userDto.toUser();
    });
  }
}
