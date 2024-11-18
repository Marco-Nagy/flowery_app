class SignUpResponseEntity {
  SignUpResponseEntity({
    this.message,
    this.error,
    this.user,
    this.token,
  });

  String? message;
  String? error;
  User? user;
  String? token;
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? id;
  String? createdAt;
}
