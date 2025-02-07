import '../../../../../auth/logged_user_data/data/models/user_model.dart';

class UserAddressResponse {
  UserAddressResponse({
    this.message,
    this.address,
    this.error
  });

  UserAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add(Address.fromJson(v));
      });
    }
  }

  String? message;
  String? error;
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
    map['error'] = error;
    if (address != null) {
      map['address'] = address?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}