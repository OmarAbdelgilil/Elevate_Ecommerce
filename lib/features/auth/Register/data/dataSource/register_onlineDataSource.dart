import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';

abstract class RegisterOnlineDatasource {
  Future<Result<RegisterResponse?>> register(RegisterRequest request);
}
