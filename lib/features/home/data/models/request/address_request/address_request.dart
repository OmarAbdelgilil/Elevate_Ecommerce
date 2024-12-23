class AddressRequest {
  AddressRequest({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.lang,
    this.username,
  });

  AddressRequest.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    lang = json['lang'];
    username = json['username'];
  }
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? lang;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['lang'] = lang;
    map['username'] = username;
    return map;
  }
}
