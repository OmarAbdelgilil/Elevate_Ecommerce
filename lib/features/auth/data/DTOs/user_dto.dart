// ignore_for_file: unused_label

import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';

class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.role,
    this.phone,
    this.isVerified,
    this.token,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender:
    json['gender'];
    role:
    json['role'];
    phone = json['phone'];
    isVerified = json['isVerified'];
    token = json['token'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? role;
  String? phone;
  bool? isVerified;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['role'] = role;
    map['phone'] = phone;
    map['isVerified'] = isVerified;
    map['token'] = token;
    return map;
  }

  User toUser() {
    return User(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        role: role,
        phone: phone,
        isVerified: isVerified,
        token: token);
  }
}
