import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';

class RegisterResponse {
  String? message;
  String? token;
  User? user;
  String? error;

  RegisterResponse({this.message, this.token, this.user, this.error});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return RegisterResponse(
        error: json['error'] as String?,
      );
    }
    return RegisterResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'user': user?.toJson(),
        'error': error,
      };
}