import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart'; // This will be generated automatically

@HiveType(typeId: 0) // Unique ID for the adapter
class UserModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? phone;

  @HiveField(6)
  String? photo;

  @HiveField(7)
  String? role;

  @HiveField(8)
  String? createdAt;

  @HiveField(9)
  String? passwordChangedAt;

  @HiveField(10)
  List<String>? wishlist;

  @HiveField(11)
  List<Address>? addresses;

  @HiveField(12)
  String? passwordResetCode;

  @HiveField(13)
  String? passwordResetExpires;

  @HiveField(14)
  bool? resetCodeVerified;

  UserModel({
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
    this.wishlist,
    this.addresses,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      photo: json['photo'],
      role: json['role'],
      createdAt: json['createdAt'],
      passwordChangedAt: json['passwordChangedAt'],
      wishlist: List<String>.from(json['wishlist'] ?? []),
      addresses: (json['addresses'] as List?)
          ?.map((address) => Address.fromJson(address))
          .toList(),
      passwordResetCode: json['passwordResetCode'],
      passwordResetExpires: json['passwordResetExpires'],
      resetCodeVerified: json['resetCodeVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'phone': phone,
      'photo': photo,
      'role': role,
      'createdAt': createdAt,
      'passwordChangedAt': passwordChangedAt,
      'wishlist': wishlist,
      'addresses': addresses?.map((address) => address.toJson()).toList(),
      'passwordResetCode': passwordResetCode,
      'passwordResetExpires': passwordResetExpires,
      'resetCodeVerified': resetCodeVerified,
    };
  }

  UserData mapUserModelToUserData(UserModel userModel) {
    return UserData(
      id: userModel.id,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      email: userModel.email,
      gender: userModel.gender,
      phone: userModel.phone,
      photo: userModel.photo,
      role: userModel.role,
      createdAt: userModel.createdAt != null
          ? DateTime.parse(userModel.createdAt!)
          : null,
      passwordChangedAt: userModel.passwordChangedAt != null
          ? DateTime.parse(userModel.passwordChangedAt!)
          : null,
      wishlist: userModel.wishlist,
      addresses:
          userModel.addresses?.map((address) => address.toJson()).toList(),
      passwordResetCode: userModel.passwordResetCode,
      passwordResetExpires: userModel.passwordResetExpires != null
          ? DateTime.parse(userModel.passwordResetExpires!)
          : null,
      resetCodeVerified: userModel.resetCodeVerified,
    );
  }
}

@HiveType(typeId: 1) // Unique ID for the Address adapter
class Address {
  @HiveField(0)
  String? street;

  @HiveField(1)
  String? phone;

  @HiveField(2)
  String? city;

  @HiveField(3)
  String? id;

  Address({this.street, this.phone, this.city, this.id});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
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
