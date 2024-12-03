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
  List<String>? addresses;

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
      addresses: List<String>.from(json['addresses'] ?? []),
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
      'addresses': addresses,
    };
  }
}

extension UserModelMapper on UserModel {
  UserData toUserData() {
    return UserData(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      createdAt: createdAt == null ? null : DateTime.parse(createdAt!),
      passwordChangedAt:
          passwordChangedAt == null ? null : DateTime.parse(passwordChangedAt!),
      wishlist: wishlist,
      addresses: addresses,
    );
  }
}
