import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';

abstract class GetLoggedUserDataRepo {
  Future<Result<UserResponse?>> getLoggedUserData();
}
