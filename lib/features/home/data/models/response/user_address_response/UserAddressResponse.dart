import 'Address.dart';

/// message : "success"
/// address : [{"street":"Home","phone":"01010700700","city":"Gizaa","_id":"67596a8d2a8d2b899c3e1ec3"}]

class UserAddressResponse {
  UserAddressResponse({
      this.message, 
      this.address,});

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
UserAddressResponse copyWith({  String? message,
  List<Address>? address,
}) => UserAddressResponse(  message: message ?? this.message,
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