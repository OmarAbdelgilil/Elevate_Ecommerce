import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatepassword_request.dart';

abstract class UpdatePasswordRepository {
  Future<Result<User?>> updatePassword(UpdatePasswordRequest request);
}
