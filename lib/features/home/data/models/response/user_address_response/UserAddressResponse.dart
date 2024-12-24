import 'Address.dart';

/// message : "success"
/// address : [{"street":"Home","phone":"01010700700","city":"Gizaa","lat":"21.12414141","lang":"21.12414141","username":"daly","_id":"6760eb271d7443525c6f92ed"},{"street":"Home","phone":"01010700700","city":"Gizaa","lat":"21.12414141","lang":"21.12414141","username":"daly","_id":"6760eb651d7443525c6f92fe"}]

class UserAddressResponse {
  UserAddressResponse({
    this.message,
    this.address,
  });

  UserAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add(Address.fromJson(v));
      });
    }
  }
  String? message;
  List<Address>? address;
  UserAddressResponse copyWith({
    String? message,
    List<Address>? address,
  }) =>
      UserAddressResponse(
        message: message ?? this.message,
        address: address ?? this.address,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (address != null) {
      map['address'] = address?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
