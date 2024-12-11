import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import '../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../repositories/home_repository.dart';

@injectable
class SaveUserAddressUseCase {
  final HomeRepository _repository;

  SaveUserAddressUseCase(this._repository);

  Future<Result<UserAddressResponse?>> saveAddress(
      AddressRequest request) async {
    return await _repository.saveUserAddress(request);
  }
}
