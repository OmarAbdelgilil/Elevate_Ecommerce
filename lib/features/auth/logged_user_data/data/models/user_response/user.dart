class UserData {
  List<dynamic>? wishlist;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  DateTime? createdAt;
  DateTime? passwordChangedAt;
  List<dynamic>? addresses;

  UserData({
    this.wishlist,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.passwordChangedAt,
    this.addresses,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        wishlist: json['wishlist'] as List<dynamic>?,
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        phone: json['phone'] as String?,
        photo: json['photo'] as String?,
        role: json['role'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        passwordChangedAt: json['passwordChangedAt'] == null
            ? null
            : DateTime.parse(json['passwordChangedAt'] as String),
        addresses: json['addresses'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'wishlist': wishlist,
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': gender,
        'phone': phone,
        'photo': photo,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'passwordChangedAt': passwordChangedAt?.toIso8601String(),
        'addresses': addresses,
      };
}
