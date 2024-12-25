import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggedUserDataOnlineDatasource)
class GetLoggedUserDataOnlineDataSourceImpl
    implements GetLoggedUserDataOnlineDatasource {
  ApiManager apiManager;
  GetLoggedUserDataOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<UserResponse?>> getLoggedUserData() async {
    final tokenProvider = TokenProvider();

    return executeApi(() async {
      final token = tokenProvider.token;
      if (token != null) {
        var result = await apiManager.getProfile('Bearer $token');
        return result;
      } else {
        throw Exception("Token not found");
      }
    });
  }
}
