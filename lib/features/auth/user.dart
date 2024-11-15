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
}