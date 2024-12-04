import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/contracts/logout_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutOnlineDatasource)
class LogoutOnlineDatasourceImpl implements LogoutOnlineDatasource {
  final ApiManager apiManager;

  LogoutOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<Logout?>> logout() {
    final tokenProvider = TokenProvider();
    return executeApi(() async {
      final token = tokenProvider.token;

      var result = await apiManager.logout('Bearer $token');
      return result;
    });
  }
}
