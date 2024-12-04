import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import '../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../repositories/home_repository.dart';

@injectable
class UpdateUserDataUseCase {
  final HomeRepository _repository;

  UpdateUserDataUseCase(this._repository);

  Future<Result<UserResponse?>> getUpdateUserData(
      UpdateProfileRequest request) async {
    return await _repository.upDateUserProfile(request);
  }
}
