import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressesUsecase {
  final AddressesRepository _addressesRepository;
  GetAddressesUsecase(this._addressesRepository);
  Future<Result<List<AddressModel>>>getAddresses() async {
    return await _addressesRepository.getAddresses();
  }
}