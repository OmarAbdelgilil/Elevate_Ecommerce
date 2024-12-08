import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';

class User {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? role;
  String? password;
  String? rePassword;
  String? phone;
  bool? isVerified;
  String? token;
  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.role,
      this.password,
      this.rePassword,
      this.phone,
      this.isVerified,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        role: json['role'] as String?,
        password: json['password'] as String?,
        rePassword: json['rePassword'] as String?,
        phone: json['phone'] as String?,
        isVerified: json['isverified'] as bool?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': gender,
        'role': role,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
        'isverified': isVerified,
        'token': token,
      };

  UserData mapUserToUserData(User user) {
    return UserData(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      gender: user.gender,
      phone: user.phone,
      role: user.role,
      // Optional: Adding default or null values for properties not present in the User model
      wishlist: [],
      photo: null,
      createdAt: null,
      passwordChangedAt: null,
      addresses: [],
    );
  }
}
