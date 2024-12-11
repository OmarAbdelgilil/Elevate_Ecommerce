
class Address {
  Address({
      this.street, 
      this.phone, 
      this.city, 
      this.id,});

  Address.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    id = json['_id'];
  }
  String? street;
  String? phone;
  String? city;
  String? id;
Address copyWith({  String? street,
  String? phone,
  String? city,
  String? id,
}) => Address(  street: street ?? this.street,
  phone: phone ?? this.phone,
  city: city ?? this.city,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['_id'] = id;
    return map;
  }

}