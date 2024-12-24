import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/DTOs/addressDTO.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressOnlineDatasource)
class AddressOnlineDatasourceImpl implements AddressOnlineDatasource {
  final ApiManager apiManager;
  AddressOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<AddressModel>>> getAddresses() {
    return executeApi(
      () async {
        final result = await apiManager.getAddresses();
        final addressModels = result!.addresses.map((address) {
          return AddressDto(
            id: address.id,
            city: address.city,
            phone: address.phone,
            street: address.street,
          ).toAddressModel();
        }).toList();

        return addressModels;
      },
    );
  }

  @override
  Future<Result<bool?>> removeAddress(String addressId) {
    return executeApi(
      () async {
        final response = await apiManager.removeAddress(addressId);
        if (response?.message == 'success') {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}
