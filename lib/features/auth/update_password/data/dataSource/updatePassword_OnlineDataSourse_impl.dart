import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/data/DTOs/user_dto.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdatePasswordOnlineDatasource)
class UpdatePasswordOnlineDatasourceImpl implements UpdatePasswordOnlineDatasource {
  final ApiManager apiManager;
  final TokenProvider tokenProvider;

  UpdatePasswordOnlineDatasourceImpl(this.apiManager, [TokenProvider? tokenProvider])
      : tokenProvider = tokenProvider ?? TokenProvider();

  @override
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request) {
    return executeApi(() async {
      final token = tokenProvider.token;
      if (token != null) {
        var result = await apiManager.updatePassword(request, 'Bearer $token');
        var user = result.user;
        var userDto = UserDto(isVerified: user?.isVerified, token: result.token);

        return userDto.toUser();
      } else {
        throw Exception("Token not found");
      }
    });
  }
}
