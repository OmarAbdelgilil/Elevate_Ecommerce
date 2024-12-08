import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';

abstract class AddressOnlineDatasource{

  Future<Result<List<AddressModel>>> getAddresses();

  Future<Result<bool?>> removeAddress(String addressId);
}