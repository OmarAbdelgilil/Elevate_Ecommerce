import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressesRepository)
class AddressesRepositoryImpl implements AddressesRepository {
  final AddressOnlineDatasource _addressOnlineDatasource;

  AddressesRepositoryImpl(this._addressOnlineDatasource);

  @override
  Future<Result<List<AddressModel>>> getAddresses() async {
    return await _addressOnlineDatasource.getAddresses();
  }

  @override
  Future<Result<bool?>> removeAddress(String addressId) async {
    return await _addressOnlineDatasource.removeAddress(addressId);
  }
}
