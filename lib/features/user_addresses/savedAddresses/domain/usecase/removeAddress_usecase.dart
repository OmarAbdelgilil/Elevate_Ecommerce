import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressUsecase {
  final AddressesRepository _addressesRepository;
  RemoveAddressUsecase(this._addressesRepository);
  Future<Result<bool?>> removeAddress(String addressId ) async {
    return await _addressesRepository.removeAddress(addressId);
  }
}