class AddressModel {
  final String street;
  final String phone;
  final String city;
  final String id;

  AddressModel({
    required this.street,
    required this.phone,
    required this.city,
    required this.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
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
