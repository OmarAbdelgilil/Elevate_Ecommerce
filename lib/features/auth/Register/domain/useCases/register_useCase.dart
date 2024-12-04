import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/repository/register_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';

@injectable
class RegisterUseCase {
  final RegisterRepository _registerRepository;
  RegisterUseCase(this._registerRepository);

  Future<Result<RegisterResponse?>> register(RegisterRequest request) async {
    return await _registerRepository.register(request);
  }
}
