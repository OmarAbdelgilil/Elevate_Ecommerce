import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';

abstract class LogoutOnlineDatasource {
  Future<Result<Logout?>> logout();
}
