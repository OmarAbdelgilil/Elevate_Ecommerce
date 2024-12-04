import '../../../../domain/model/user.dart';
import 'user.dart';

class UserResponse {
  String? message;
  UserData? user;

  UserResponse({this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserData.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };

  User toDomain() {
    return User(
      id: user?.id,
      firstName: user?.firstName,
      lastName: user?.lastName,
      email: user?.email,
      phone: user?.phone,
      gender: user?.gender,
    );
  }
}
