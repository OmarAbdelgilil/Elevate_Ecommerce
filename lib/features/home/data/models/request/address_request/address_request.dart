
class AddressRequest {
  AddressRequest({
    this.street,
    this.phone,
    this.city,
});

  AddressRequest.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];

  }
  String? street;
  String? phone;
  String? city;

  AddressRequest copyWith({  String? street,
    String? phone,
    String? city,
    String? id,
  }) => AddressRequest(  street: street ?? this.street,
    phone: phone ?? this.phone,
    city: city ?? this.city,

  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;

    return map;
  }

}