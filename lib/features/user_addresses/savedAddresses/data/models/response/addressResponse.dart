import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';

class AddressResponse {
  final String message;
  final List<AddressModel> addresses;

  AddressResponse({
    required this.message,
    required this.addresses,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      message: json['message'],
      addresses: (json['addresses'] as List)
          .map((address) => AddressModel.fromJson(address))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'addresses': addresses.map((address) => address.toJson()).toList(),
    };
  }
}
