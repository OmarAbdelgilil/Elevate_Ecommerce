import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/register_repository.dart';
import 'package:elevate_ecommerce/features/auth/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase{
  final RegisterRepository _registerRepository;
  RegisterUseCase(this._registerRepository);

  Future<Result<User?>> register(RegisterRequest request) async {
    return await _registerRepository.register(request);
  }
}