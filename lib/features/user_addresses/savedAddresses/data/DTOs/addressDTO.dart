import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';

class AddressDto {
  String? street;
  String? phone;
  String? city;
  String? id;

  AddressDto({this.street, this.phone, this.city, this.id});

  AddressModel toAddressModel() {
    return AddressModel(
      street: street ?? '',
      phone: phone ?? '',
      city: city ?? '',
      id: id ?? '',
    );
  }

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return AddressDto(
      street: json['street'],
      phone: json['phone'],
      city: json['city'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'phone': phone,
      'city': city,
      '_id': id,
    };
  }
}
