/// street : "Home"
/// phone : "01010700700"
/// city : "Gizaa"
/// lat : "21.12414141"
/// lang : "21.12414141"
/// username : "daly"
/// _id : "6760eb271d7443525c6f92ed"
library;

class Address {
  Address({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.lang,
    this.username,
    this.id,
  });

  Address.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    lang = json['lang'];
    username = json['username'];
    id = json['_id'];
  }
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? lang;
  String? username;
  String? id;
  Address copyWith({
    String? street,
    String? phone,
    String? city,
    String? lat,
    String? lang,
    String? username,
    String? id,
  }) =>
      Address(
        street: street ?? this.street,
        phone: phone ?? this.phone,
        city: city ?? this.city,
        lat: lat ?? this.lat,
        lang: lang ?? this.lang,
        username: username ?? this.username,
        id: id ?? this.id,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['lang'] = lang;
    map['username'] = username;
    map['_id'] = id;
    return map;
  }
}
